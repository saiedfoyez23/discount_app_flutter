import 'dart:io';

import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class SignUpScreenWidget {

  final SignUpController signUpController = Get.put(SignUpController());


  Widget signUpScreenWidget({required BuildContext context}) {
    return Obx(()=>Container(
      height: 926.h(context),
      width: 428.w(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBg),
          fit: BoxFit.fill,
          opacity: 0.3,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.dstATop),
        ),
      ),
      child: CustomScrollView(
        slivers: [


          CustomAppBarContainer().authScreenAppBar(
            context: context,
            title: "Create Account",
            onPress: () async {
              Get.off(()=>const WelcomeScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
            },
          ),


          SliverToBoxAdapter(
            child: Container(
              width: 428.w(context),
              padding: EdgeInsets.symmetric(
                horizontal: 21.hpm(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider" ?
                    160.h(context) : 0.h(context),
                    width: 428.w(context),
                    curve: Curves.easeIn,
                    child: Visibility(
                      visible: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider",
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height:signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider" ?
                              120.h(context) : 0.h(context),
                              width: 120.w(context),
                              decoration: const BoxDecoration(
                                color: Colors.transparent
                              ),
                            ),
                            Positioned(
                                child: signUpController.imageFile.value.path == "" ? CustomImageContainer.assetImageContainer(
                                    height: 110.h(context),
                                    width: 110.w(context),
                                    assetImage: AppImages.imagePickerIcon,
                                    boxFit: BoxFit.fitWidth,
                                    boxShape: BoxShape.circle,
                                    borderColors: AppColors.green176,
                                    borderWidth: 1
                                ) :
                                CustomImageContainer.fileImageContainer(
                                    height: 110.h(context),
                                    width: 110.w(context),
                                    file: signUpController.imageFile.value,
                                    boxFit: BoxFit.fitWidth,
                                    boxShape: BoxShape.circle,
                                    borderColors: AppColors.green176,
                                    borderWidth: 1
                                ) ,
                            ),
                            Positioned(
                              top: 70.h(context),
                              left: 70.w(context),
                              child: Container(
                                width: 40.h(context),
                                height: 40.w(context),
                                decoration: BoxDecoration(
                                    color: AppColors.white253,
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
                                                    signUpController.imageFile.value = File(pickedFile.path);
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
                                                    signUpController.imageFile.value = File(pickedFile.path);
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
                                    color: AppColors.secondaryColor,
                                    size: 28.r(context),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  Container(
                    height: 60.h(context),
                    width: 428.w(context),
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Material(
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // User Radio Button

                            Row(
                              children: [
                                Radio<String>(
                                  value: "User",
                                  groupValue: signUpController.selectedRole.value,
                                  onChanged: (value) async {
                                    signUpController.changeRole(value!);
                                    await signUpController.resetFunction();
                                  },
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                      return  signUpController.selectedRole.value == "User"
                                          ? AppColors.orange41
                                          : AppColors.white253;
                                    },
                                  ),
                                ),
                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                    plainTextString: "User",
                                    plainTextStringFontSize: 16.sp(context),
                                    plainTextStringFontWeight: FontWeight.w600,
                                    plainTextContainerAlignment: Alignment.centerLeft,
                                    plainTextStringColor: signUpController.selectedRole.value == "User"
                                        ? AppColors.orange41
                                        : AppColors.white253
                                ),
                              ],
                            ),

                            CustomSpaceWidget.spacerWidget(spaceWidth: 20.w(context)),

                            Row(
                              children: [
                                Radio<String>(
                                  value: "Rider",
                                  groupValue: signUpController.selectedRole.value,
                                  onChanged: (value) async {
                                    signUpController.changeRole(value!);
                                    await signUpController.resetFunction();
                                  },
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                      return  signUpController.selectedRole.value == "Rider"
                                          ? AppColors.orange41
                                          : AppColors.white253;
                                    },
                                  ),
                                ),
                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                    plainTextString: "Rider",
                                    plainTextStringFontSize: 16.sp(context),
                                    plainTextStringFontWeight: FontWeight.w600,
                                    plainTextContainerAlignment: Alignment.centerLeft,
                                    plainTextStringColor: signUpController.selectedRole.value == "Rider"
                                        ? AppColors.orange41
                                        : AppColors.white253
                                ),
                              ],
                            ),

                            CustomSpaceWidget.spacerWidget(spaceWidth: 20.w(context)),


                            Row(
                              children: [
                                Radio<String>(
                                  value: "Vendor",
                                  groupValue: signUpController.selectedRole.value,
                                  onChanged: (value) async {
                                    signUpController.changeRole(value!);
                                    await signUpController.resetFunction();
                                  },
                                  fillColor: WidgetStateProperty.resolveWith<Color>(
                                        (Set<WidgetState> states) {
                                      return  signUpController.selectedRole.value == "Vendor"
                                          ? AppColors.orange41
                                          : AppColors.white253;
                                    },
                                  ),
                                ),
                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                    plainTextString: "Vendor",
                                    plainTextStringFontSize: 16.sp(context),
                                    plainTextStringFontWeight: FontWeight.w600,
                                    plainTextContainerAlignment: Alignment.centerLeft,
                                    plainTextStringColor: signUpController.selectedRole.value == "Vendor"
                                        ? AppColors.orange41
                                        : AppColors.white253
                                ),
                              ],
                            ),

                            CustomSpaceWidget.spacerWidget(spaceWidth: 20.w(context)),


                          ],
                        ),
                      ),
                    ),
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                  Visibility(
                    visible: signUpController.selectedRole.value == "Vendor",
                    child: Column(
                      children: [
                        Column(
                          children: [
                            CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              plainTextString: "Restaurant Name",
                              plainTextStringFontSize: 20.sp(context),
                              plainTextStringFontWeight: FontWeight.w600,
                              plainTextContainerAlignment: Alignment.centerLeft,
                              plainTextStringColor: AppColors.white253,
                            ),

                            CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                            CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                              context: context,
                              controller: signUpController.restaurantNameController.value,
                              hintText: "Restaurant Name",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //space

                  Visibility(
                    visible: signUpController.selectedRole.value == "Vendor",
                    child: CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                  ),


                  Visibility(
                    visible: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider",
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "First Name",
                                plainTextStringFontSize: 20.sp(context),
                                plainTextStringFontWeight: FontWeight.w600,
                                plainTextContainerAlignment: Alignment.centerLeft,
                                plainTextStringColor: AppColors.white253,
                              ),

                              CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                              CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                                context: context,
                                controller: signUpController.firstNameController.value,
                                hintText: "First Name",
                              ),
                            ],
                          ),
                        ),

                        CustomSpaceWidget.spacerWidget(spaceWidth: 10.w(context)),

                        Expanded(
                          child: Column(
                            children: [
                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "Last Name",
                                plainTextStringFontSize: 20.sp(context),
                                plainTextStringFontWeight: FontWeight.w600,
                                plainTextContainerAlignment: Alignment.centerLeft,
                                plainTextStringColor: AppColors.white253,
                              ),

                              CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                              CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                                context: context,
                                controller: signUpController.lastNameController.value,
                                hintText: "Last Name",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),



                  Visibility(
                      visible: signUpController.selectedRole.value == "Vendor",
                      child: Column(
                        children: [

                          CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                            plainTextString: "Restaurant Description",
                            plainTextStringFontSize: 20.sp(context),
                            plainTextStringFontWeight: FontWeight.w600,
                            plainTextContainerAlignment: Alignment.centerLeft,
                            plainTextStringColor: AppColors.white253,
                          ),

                          CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                          CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                            context: context,
                            controller: signUpController.restaurantDescriptionController.value,
                            hintText: "Enter description...",
                          ),
                        ],
                      )
                  ),


                  Visibility(
                      visible: signUpController.selectedRole.value == "Vendor" || signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider",
                      child:  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                  ),


                  /// contact for user, rider and vendor
                  Visibility(
                    visible: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider"
                        || signUpController.selectedRole.value == "Vendor",
                    child: Column(
                      children: [

                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Email address",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                        CustomTextFormFieldWidget().normalTextFormFiledWidgetWithIcon(
                          context: context,
                          controller: signUpController.emailController.value,
                          hintText: "Enter Email",
                          prefixIcon: const Icon(Icons.email_outlined,size: 24, color: Colors.black),
                        ),
                      ],
                    )
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  /// contact for user, rider and vendor
                  Visibility(
                      visible: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider"
                          || signUpController.selectedRole.value == "Vendor",
                      child: Column(
                        children: [

                          CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                            plainTextString: "Location",
                            plainTextStringFontSize: 20.sp(context),
                            plainTextStringFontWeight: FontWeight.w600,
                            plainTextContainerAlignment: Alignment.centerLeft,
                            plainTextStringColor: AppColors.white253,
                          ),

                          CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                          CustomTextFormFieldWidget().normalTextFormFiledWidgetWithIcon(
                            context: context,
                            controller: signUpController.locationController.value,
                            hintText: "Enter Location",
                            prefixIcon: const Icon(Icons.location_on_outlined,size: 24, color: Colors.black),
                          ),
                        ],
                      )
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  Visibility(
                    visible: signUpController.selectedRole.value == "User" ||
                        signUpController.selectedRole.value == "Rider" ||
                        signUpController.selectedRole.value == "Vendor",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Contact Field
                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Contact",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                        Container(
                          width: 428.w(context),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10.hpm(context)),
                          decoration: BoxDecoration(
                            color: AppColors.white253,
                            borderRadius: BorderRadius.circular(8.r(context)),
                          ),
                          child: Material( // Wrapping with Material
                            color: Colors.transparent, // Keep transparent if needed
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                signUpController.contact.value = number.phoneNumber.toString();
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                useEmoji: true,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: const TextStyle(color: Colors.black),
                              initialValue: PhoneNumber(isoCode: 'BD'),
                              formatInput: true,
                              inputDecoration: InputDecoration(
                                hintStyle: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.sp(context),
                                  color: AppColors.black114,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),


                  /// Ebt holder for user
                  // Visibility(
                  //   visible: signUpController.selectedRole.value == "User",
                  //   child: Column(
                  //     children: [
                  //
                  //       CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                  //
                  //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  //         plainTextString: "Are you a first responder or EBT card holder?(Optional)",
                  //         plainTextStringFontSize: 20.sp(context),
                  //         plainTextStringFontWeight: FontWeight.w600,
                  //         plainTextContainerAlignment: Alignment.centerLeft,
                  //         plainTextStringTextAlign: TextAlign.start,
                  //         plainTextStringColor: AppColors.white253,
                  //       ),
                  //
                  //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                  //
                  //       DropdownButtonFormField<String>(
                  //         value: signUpController.selectedPosition.value == "" ? null : signUpController.selectedPosition.value,
                  //         dropdownColor: Colors.white,  // Dropdown menu background color
                  //         style: GoogleFonts.urbanist(
                  //           fontWeight: FontWeight.w700,
                  //           fontSize: 20.sp(context),
                  //           color: AppColors.black29,
                  //         ), // Hin
                  //         hint: Text(
                  //           'Select an option',
                  //           style: GoogleFonts.urbanist(
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: 20.sp(context),
                  //             color: AppColors.black114,
                  //           ), // Hint text color
                  //         ),
                  //         items: signUpController.positions.map((position) {
                  //           return DropdownMenuItem(
                  //             value: position,
                  //             child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  //               plainTextString: position,
                  //               plainTextStringFontSize: 20.sp(context),
                  //               plainTextStringFontWeight: FontWeight.w600,
                  //               plainTextContainerAlignment: Alignment.centerLeft,
                  //               plainTextStringColor: AppColors.black29,
                  //             ),
                  //           );
                  //         }).toList(),
                  //         onChanged: (newValue) {
                  //           signUpController.selectedPosition.value = newValue!;
                  //           // setState(() {
                  //           //   _selectedPosition = newValue;
                  //           // });
                  //         },
                  //         decoration: InputDecoration(
                  //           filled: true,  // Enables background fill
                  //           fillColor: Colors.white,  // Set the background fill color to white
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(color: AppColors.secondaryColor),
                  //               borderRadius: BorderRadius.all(Radius.circular(8.r(context)))
                  //           ),
                  //           contentPadding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  /// document verify for user
                  Visibility(
                    visible: signUpController.selectedRole.value == "User",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Please upload documents to verify",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                        CustomDottedWidget(
                          dottedColor: Colors.white,
                          textColor: Colors.white,
                          buttonColor: Colors.white,
                          onPress: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
                            );
                            if (result != null) {
                              // The user has selected a file
                              PlatformFile file = result.files.first;
                              // Do something with the file (e.g., upload it)
                              print('File selected: ${file.name}');
                              signUpController.documentFile.value = File(file.path!);
                            } else {
                              CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                            }
                          },
                        )
                      ],
                    ),
                  ),

                  /// document verify for rider
                  Visibility(
                    visible: signUpController.selectedRole.value == "Rider",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Upload driving license",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                        CustomDottedWidget(
                            dottedColor: Colors.white,
                            buttonColor: Colors.white,
                            textColor: Colors.white,
                            onPress: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
                              );
                              if (result != null) {
                                // The user has selected a file
                                PlatformFile file = result.files.first;
                                // Do something with the file (e.g., upload it)
                                print('File selected: ${file.name}');
                                signUpController.drivingLicenceFile.value = File(file.path!);
                              } else {
                                CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                              }
                            }
                        ),
                      ],
                    ),
                  ),

                  /// Upload Cover Photo for Vendor
                  Visibility(
                    visible: signUpController.selectedRole.value == "Vendor",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Upload Cover Photo",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                        CustomDottedWidget(
                            dottedColor: Colors.white,
                            buttonColor: Colors.white,
                            textColor: Colors.white,
                            onPress: () {
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
                                              signUpController.coverFile.value = File(pickedFile.path);
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
                                              signUpController.coverFile.value = File(pickedFile.path);
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
                            }
                        ),
                      ],
                    ),
                  ),

                  /// Upload Cover Photo for Vendor
                  Visibility(
                    visible: signUpController.selectedRole.value == "Vendor",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Upload Tax Document",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                        CustomDottedWidget(
                            dottedColor: Colors.white,
                            buttonColor: Colors.white,
                            textColor: Colors.white,
                            onPress: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
                              );
                              if (result != null) {
                                // The user has selected a file
                                PlatformFile file = result.files.first;
                                // Do something with the file (e.g., upload it)
                                print('File selected: ${file.name}');
                                signUpController.taxFile.value = File(file.path!);
                              } else {
                                CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                              }
                            }
                        ),
                      ],
                    ),
                  ),


                  Visibility(
                    visible: signUpController.selectedRole.value == "User" ||
                        signUpController.selectedRole.value == "Rider" ||
                        signUpController.selectedRole.value == "Vendor",
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Enter Password",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                        CustomTextFormFieldWidget().passwordTextFormFieldWidgetWithIcon(
                          context: context,
                          controller: signUpController.passwordController.value,
                          hintText: "Enter Password",
                          prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                          obscureText: !signUpController.isPasswordVisible.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              signUpController.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () async {
                              await signUpController.togglePasswordVisibility();
                            },
                          ),
                        ),


                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Enter Confirm Password",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: AppColors.white253,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                        CustomTextFormFieldWidget().passwordTextFormFieldWidgetWithIcon(
                          context: context,
                          controller: signUpController.confirmPasswordController.value,
                          hintText: "Enter Confirm Password",
                          prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                          obscureText: !signUpController.isConfirmPasswordVisible.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              signUpController.isConfirmPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () async {
                              await signUpController.toggleConfirmPasswordVisibility();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),



                  signUpController.isSubmit.value == true ?
                  Container(
                    height: 64.h(context),
                    width: 428.h(context),
                    decoration: const BoxDecoration(
                        color: Colors.transparent
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.white253,),
                    ),
                  ) :
                  CustomButtonContainer.plainButtonContainer(
                    plainButtonHeight: 64.h(context),
                    plainButtonWidth: 428.w(context),
                    plainButtonRadius: 8.r(context),
                    plainButtonOnPress:  () async {
                      Get.off(()=>OtpVerifyScreen(email: signUpController.emailController.value.text, isSignUp: true),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                    },
                    plainButtonHint: "Sign Up",
                    plainButtonHintFontSize: 22.sp(context),
                    plainButtonColor: AppColors.green176,
                    plainButtonHintFontColor: AppColors.white255,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                  CustomRichTextContainer.plainRichTextContainerWidgetWithoutWidthHeight(
                      context: context,
                      plainPrimaryTextStringAlign: TextAlign.center,
                      plainPrimaryTextString: "Already have an account? ",
                      plainRichTextStringFontSize: 20.sp(context),
                      plainRichTextStringColor: AppColors.white253,
                      plainRichTextStringFontWeight: FontWeight.w500,
                      textSpanList: [
                        TextSpan(
                          text: "Log In",
                          style: CustomRichTextContainer.plainRichTextStringStyleWithDecoration(
                              context: context,
                              plainRichTextStringFontSize: 20.sp(context),
                              plainRichTextStringColor:AppColors.orange125,
                              plainRichTextStringFontWeight: FontWeight.w600
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.off(()=>SignInScreen(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
                          },
                        ),
                      ]
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),


                ],
              ),
            ),
          ),



        ],
      ),
    ));
  }



}