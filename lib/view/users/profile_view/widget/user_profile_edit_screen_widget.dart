import 'dart:io';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../res/common_widget/custom_text.dart';
import '../../../../res/common_widget/custom_textfield_with_label.dart';

class UserProfileEditScreenWidget extends GetxController {

  Rx<File> imageFile = File("").obs;
  Rx<File> documentFile = File("").obs;
  RxBool isSubmit = false.obs;
  RxBool isLoading = false.obs;

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  RxString image = "".obs;
  RxString contact = "".obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  BuildContext context;
  UserProfileEditScreenWidget({required this.context});




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await UserProfileController.getUserProfileApiService(
          onSuccess: (e) {
            isLoading.value = false;
            userProfileResponseModel.value = UserProfileResponseModel.fromJson(e);
            firstNameController.value.text = userProfileResponseModel.value.data?.name ?? "N/A";
            emailController.value.text = userProfileResponseModel.value.data?.email ?? "N/A";
            locationController.value.text = userProfileResponseModel.value.data?.location ?? "N/A";
            contact.value = userProfileResponseModel.value.data?.contact ?? "N/A";
            image.value = userProfileResponseModel.value.data?.image ?? "";
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


  Widget userProfileEditScreenWidget({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppImages.homeBg),
          alignment: Alignment.topRight,
          opacity: 0.5,
        ),
      ),
      child: Obx(()=>Skeletonizer(
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
                        Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
                                  assetImage:  AppImages.imagePickerIcon,
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
                                  shape: BoxShape.circle,
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

                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfieldWithLabel(
                            labelTextColor: Colors.black,
                            labelName: "First name",
                            hint: "First name",
                            controller: firstNameController.value,
                          ),
                        ),
                        CustomSpaceWidget.spacerWidget(spaceWidth: 10.w(context)),
                        Expanded(
                          child: CustomTextfieldWithLabel(
                            labelTextColor: Colors.black,
                            labelName: "Last name",
                            hint: "Last name",
                            controller: lastNameController.value,
                          ),
                        ),
                      ],
                    ),


                    CustomTextfieldWithLabel(
                      labelTextColor: Colors.black,
                      labelName: "Email",
                      hint: "roy@roy.com",
                      controller: emailController.value,
                      readOnly: true,
                    ),

                    // CustomTextfieldWithLabel(
                    //   labelTextColor: Colors.black,
                    //   labelName: "Are you a first responder or EBT card holder",
                    //   hint: "Police",
                    // ),
                    //
                    // CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                    //
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     CustomText(
                    //       title: "EBT Documents",
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 18.sp(context),
                    //       color: Colors.black,
                    //     ),
                    //     CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                    //     Image.network(
                    //       "https://upload.wikimedia.org/wikipedia/commons/c/cd/Washington_State_Enhanced_Driver%27s_License_-_Sample.webp",
                    //       height: 200.h(context), width: 428.w(context), fit: BoxFit.cover,)
                    //         ??Container(
                    //       height: 200.h(context),
                    //       width: 428.w(context),
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(8.r(context)),
                    //         border: Border.all(color: Colors.grey, width: 0.5),
                    //       ),
                    //       child: Text("EBT Documents is empty"),
                    //     )
                    //   ],
                    // ),
                    //CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                    CustomTextfieldWithLabel(
                      labelTextColor: Colors.black,
                      labelName: "Location",
                      hint: "London park, UK",
                      controller: locationController.value,
                    ),

                    // country code picker
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Contact",
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp(context),
                          color: Colors.black,
                        ),
                        CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10.w(context)),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r(context)),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Material(
                            // Wrapping with Material
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
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


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
                        await UserProfileEditController.getUserUpdateResponse(
                            name: "${firstNameController.value.text} ${lastNameController.value.text}",
                            email: emailController.value.text,
                            location: locationController.value.text,
                            contact: contact.value,
                            onSuccess: (e) {
                              isSubmit.value = false;
                              Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
                            image: imageFile.value
                        );// C
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
      )),
    );
  }




}