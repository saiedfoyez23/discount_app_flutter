import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:discount_me_app/utils/utils.dart';
import '../../../../res/common_widget/RoundTextField.dart';
import '../../../../res/common_widget/custom_text.dart';
import '../../../../res/res.dart';
import '../../../view.dart';

class RiderProfileEditScreenWidget extends GetxController{
  
  Rx<File> imageFile = File("").obs;
  Rx<File> documentFile = File("").obs;
  RxBool isSubmit = false.obs;
  RxBool isLoading = false.obs;

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  RxString image = "".obs;
  RxString document = "".obs;
  RxString contact = "".obs;

  Rx<RiderProfileResponse> riderProfileResponse = RiderProfileResponse().obs;
  BuildContext context;
  Rx<TextEditingController> nameControllerText = TextEditingController().obs;
  RiderProfileEditScreenWidget({required this.context});




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await RiderProfileController.getRiderProfileApiService(
          onSuccess: (e) {
            isLoading.value = false;
            riderProfileResponse.value = RiderProfileResponse.fromJson(e);
            firstNameController.value.text = riderProfileResponse.value.data?.name ?? "N/A";
            emailController.value.text =riderProfileResponse.value.data?.email ?? "N/A";
            locationController.value.text = riderProfileResponse.value.data?.location ?? "N/A";
            contact.value = riderProfileResponse.value.data?.contact ?? "N/A";
            image.value = riderProfileResponse.value.data?.image ?? "";
            document.value = riderProfileResponse.value.data?.drivingLicense ?? "N/A";
          },
          onFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          },
          onExceptionFail: (e) async {
            if(e == "jwt expired") {
              await AppLocalStorage.removeKey(key: "Login");
              await Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
            }
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          }
      );
    });
  }


  Widget riderProfileEditScreenWidget({required BuildContext context}) {
    return Obx(()=>Container(
      height: 926.h(context),
      width: 428.w(context),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Skeletonizer(
        effect: PulseEffect(),
        enabled: isLoading.value,
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                child: Column(
                  children: [

                    CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                    UserProfileAppbarWidget(
                      title: "Edit Profile",
                      onTap: () {
                        Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                      },
                    ),


                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 250.h(context),
                      width: 428.w(context),
                      curve: Curves.easeIn,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 120.h(context),
                              width: 120.w(context),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent
                              ),
                            ),

                            if(image.value != "" &&  imageFile.value.path == "")...[
                              Positioned(
                                child: CustomImageContainer.networkImageContainer(
                                  height: 220.h(context),
                                  width: 220.w(context),
                                  networkImage: image.value,
                                  boxFit: BoxFit.fitWidth,
                                  boxShape: BoxShape.circle,
                                  borderColors: ColorUtils.primaryColor,
                                  borderWidth: 1,
                                ),
                              ),
                            ] else if(imageFile.value.path != "" && image.value == "")...[
                              Positioned(
                                child:CustomImageContainer.fileImageContainer(
                                  height: 220.h(context),
                                  width: 220.w(context),
                                  file: imageFile.value,
                                  boxFit: BoxFit.fitWidth,
                                  boxShape: BoxShape.circle,
                                  borderColors: ColorUtils.primaryColor,
                                  borderWidth: 1,
                                ),
                              ),
                            ] else if(image.value == "" &&  imageFile.value.path == "")...[
                              Positioned(
                                child: CustomImageContainer.assetImageContainer(
                                  height: 220.h(context),
                                  width: 220.w(context),
                                  assetImage: ImageUtils.imagePickerIcon,
                                  boxFit: BoxFit.fitWidth,
                                  boxShape: BoxShape.circle,
                                  borderColors: ColorUtils.primaryColor,
                                  borderWidth: 1,
                                ),
                              ),
                            ] else...[
                              Positioned(
                                child: CustomSpaceWidget.spacerWidget(),
                              ),
                            ],


                            Positioned(
                              top: 155.h(context),
                              left: 155.w(context),
                              child: Container(
                                width: 60.h(context),
                                height: 60.w(context),
                                decoration: BoxDecoration(
                                    color: ColorUtils.white253,
                                    shape: BoxShape.circle
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Select Profile Image'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(Icons.photo_library),
                                                title: Text('Gallery'),
                                                onTap: () async {
                                                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                  if (pickedFile != null) {
                                                    print('Image selected: ${pickedFile.path}');
                                                    imageFile.value = File(pickedFile.path);
                                                    image.value = "";
                                                  } else {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('No image selected'),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  }
                                                  Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.camera_alt),
                                                title: Text('Camera'),
                                                onTap: () async {
                                                  final pickedFile = await ImagePicker().pickImage(
                                                      source: ImageSource.camera);
                                                  if (pickedFile != null) {
                                                    // Handle the picked image (e.g., update profile)
                                                    imageFile.value = File(pickedFile.path);
                                                    image.value = "";
                                                    print('Image selected: ${pickedFile.path}');
                                                  } else {
                                                    // Show a SnackBar if no image is selected before popping the dialog
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('No image selected'),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  }
                                                  Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: ColorUtils.secondaryColor,
                                    size: 28.r(context),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),


                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(title: "First name",
                                fontWeight: FontWeight.w600,
                                fontSize: 26.sp(context),
                                color: Colors.black,
                              ),
                              CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                              RoundTextField(
                                hint: "First name",
                                controller: firstNameController.value,
                              ),
                            ],
                          ),
                        ),
                        CustomSpaceWidget.spacerWidget(spaceWidth: 10.w(context)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(title: "Last name",
                                fontWeight: FontWeight.w600,
                                fontSize: 26.sp(context),
                                color: Colors.black,
                              ),
                              CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                              RoundTextField(
                                hint: "Last name",
                                controller: lastNameController.value,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),


                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: "Email address",
                          fontWeight: FontWeight.w600,
                          fontSize: 26.sp(context),
                          color: Colors.black,
                        ),
                        CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                        RoundTextField(
                          hint: "Enter your email address",
                          prefixIcon: Icon(Icons.email_outlined, color: Colors.black54),
                          controller: emailController.value,
                          readOnly: true,
                        ),
                      ],
                    ),


                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: "Location",
                          fontWeight: FontWeight.w600,
                          fontSize: 26.sp(context),
                          color: Colors.black,
                        ),
                        CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                        RoundTextField(
                          hint: "enter your location",
                          prefixIcon: Icon(Icons.location_on_outlined, color: Colors.black54),
                          controller: locationController.value,
                        ),
                      ],
                    ),



                    // country code picker

                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: "Contact",
                          fontWeight: FontWeight.w600,
                          fontSize: 26.sp(context),
                          color: Colors.black,
                        ),
                        CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10.hpm(context)),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r(context)),
                              border: Border.all(width: 1, color: Colors.grey)
                          ),
                          child: Material( // Wrapping with Material
                            color: Colors.transparent, // Keep transparent if needed
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                contact.value = number.phoneNumber.toString();
                              },
                              selectorConfig: SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                useEmoji: true,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: const TextStyle(color: Colors.black),
                              initialValue: PhoneNumber(isoCode: 'BD',phoneNumber: contact.value),
                              formatInput: true,
                              inputDecoration: const InputDecoration(
                                hintText: 'Enter your number',
                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(title: "Upload Driving License ",
                          fontWeight: FontWeight.w600,
                          fontSize: 26.sp(context),
                          color: Colors.black,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),

                        document.value != "" ?
                        Container(
                          height: 200.h(context),
                          width: 428.w(context),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'svg'],
                              );
                              if (result != null) {
                                // The user has selected a file
                                PlatformFile file = result.files.first;
                                // Do something with the file (e.g., upload it)
                                print('File selected: ${file.name}');
                                documentFile.value = File(file.path!);
                              } else {
                                CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                              }
                            },
                            child: documentFile.value.path == "" && document.value != ""?
                            Image.network(
                              document.value,
                              width: 428.w(context),
                              height: 200.h(context),
                              fit: BoxFit.fill,
                            ) : Image.file(
                              documentFile.value,
                              width: 428.w(context),
                              height: 200.h(context),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ) :
                        CustomDottedWidget(
                          dottedColor: Colors.white,
                          textColor: Colors.white,
                          buttonColor: Colors.white,
                          lable: documentFile.value.path.split('/').last,
                          onPress: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'svg'],
                            );
                            if (result != null) {
                              // The user has selected a file
                              PlatformFile file = result.files.first;
                              // Do something with the file (e.g., upload it)
                              print('File selected: ${file.name}');
                              documentFile.value = File(file.path!);
                            } else {
                              CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                            }
                          },
                        ),
                      ],
                    ),


                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                    isSubmit.value == true ?
                    Container(
                      height: 64.h(context),
                      width: 428.h(context),
                      decoration: const BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(color: ColorUtils.green176,),
                      ),
                    ) :
                    CustomButtonContainer.plainButtonContainer(
                      plainButtonHeight: 64.h(context),
                      plainButtonWidth: 428.w(context),
                      plainButtonRadius: 8.r(context),
                      plainButtonOnPress:  () async {
                        isSubmit.value = true;
                        await RiderProfileEditController.getRiderUpdateResponse(
                          riderId: riderProfileResponse.value.data?.sId ?? "",
                          name: "${firstNameController.value.text} ${lastNameController.value.text}",
                          email: emailController.value.text,
                          location: locationController.value.text,
                          contact: contact.value,
                          onSuccess: (e) {
                            isSubmit.value = false;
                            Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                          },
                          onFail: (e) {
                            isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          onExceptionFail: (e) {
                            isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          image: imageFile.value,
                          document: documentFile.value,
                        );
                      },
                      plainButtonHint: "Update",
                      plainButtonHintFontSize: 22.sp(context),
                      plainButtonColor: ColorUtils.green176,
                      plainButtonHintFontColor: ColorUtils.white255,
                    ),


                  ],
                ),
              ),
            )

          ],
        ),
      ),
    ));
  }



}