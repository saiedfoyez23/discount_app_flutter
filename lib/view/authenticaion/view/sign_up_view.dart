import 'dart:io';
import 'dart:ui';
import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/authenticaion/widget/sign_up_widget/role_wise_form_fields.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  
  final SignUpController signUpController = Get.put(SignUpController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          Get.off(()=>WelcomeView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        },
        child: Obx(()=>Container(
          height: 926.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
          
              Container(
                height: 926.h(context),
                width: 428.w(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageUtils.authBg),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
          
          
          
              /// Blur Effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  height: 926.h(context),
                  width: 428.w(context),
                  color: ColorUtils.black36,
                ),
              ),
          
          
              Container(
                height: 926.h(context),
                width: 428.w(context),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: SafeArea(
                  child: CustomScrollView(
                    slivers: [
                            
                            
                      CustomAppBarContainer().authScreenAppBar(
                        context: context,
                        title: "Create Account",
                        onPress: () async {
                          Get.off(()=>WelcomeView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                        },
                      ),
                            
                            
                      SliverToBoxAdapter(
                        child: Container(
                          width: 428.w(context),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.hpm(context),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              
                              
                              SpaceHelperWidget.v(20.h(context)),
                            



                              ProfileImagePicker().profileImagePicker(
                                context: context,
                                selectedRole: signUpController.selectedRole.value,
                                signUpController: signUpController,
                              ),


                              SpaceHelperWidget.v(20.h(context)),


                              RoleSelectRadioButton().roleSelectRadioButton(
                                context: context,
                                roles: const ["User", "Rider", "Vendor", "Broker"],
                                signUpController: signUpController,
                                onChanged: (value) async {
                                  signUpController.changeRole(value);

                                  await signUpController.resetFunction();

                                  if (value == "Vendor") {
                                    await signUpController.checkLocationPermission();
                                  }
                                },
                              ),
                            
                            
                              CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                              RoleWiseFormField().roleWiseFormFields(
                                context: context,
                                selectedRole: signUpController.selectedRole.value,
                                controller: signUpController,
                              ),

                            
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "Vendor",
                              //   child: Column(
                              //     children: [
                              //       Column(
                              //         children: [
                              //           CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //             plainTextString: "Restaurant Name",
                              //             plainTextStringFontSize: 20.sp(context),
                              //             plainTextStringFontWeight: FontWeight.w600,
                              //             plainTextContainerAlignment: Alignment.centerLeft,
                              //             plainTextStringColor: ColorUtils.white253,
                              //           ),
                              //
                              //           CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //           CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                              //             context: context,
                              //             controller: signUpController.restaurantNameController.value,
                              //             hintText: "Restaurant Name",
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //
                              // //space
                              //
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "Vendor",
                              //   child: CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              // ),
                              //
                              //
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "User" ||
                              //       signUpController.selectedRole.value == "Rider" ||
                              //       signUpController.selectedRole.value == "Broker",
                              //   child: Row(
                              //     children: [
                              //       Expanded(
                              //         child: Column(
                              //           children: [
                              //             CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //               plainTextString: "First Name",
                              //               plainTextStringFontSize: 20.sp(context),
                              //               plainTextStringFontWeight: FontWeight.w600,
                              //               plainTextContainerAlignment: Alignment.centerLeft,
                              //               plainTextStringColor: ColorUtils.white253,
                              //             ),
                              //
                              //             CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //             CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                              //               context: context,
                              //               controller: signUpController.firstNameController.value,
                              //               hintText: "First Name",
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceWidth: 10.w(context)),
                              //
                              //       Expanded(
                              //         child: Column(
                              //           children: [
                              //             CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //               plainTextString: "Last Name",
                              //               plainTextStringFontSize: 20.sp(context),
                              //               plainTextStringFontWeight: FontWeight.w600,
                              //               plainTextContainerAlignment: Alignment.centerLeft,
                              //               plainTextStringColor: ColorUtils.white253,
                              //             ),
                              //
                              //             CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //             CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                              //               context: context,
                              //               controller: signUpController.lastNameController.value,
                              //               hintText: "Last Name",
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //
                              //
                              //
                              // Visibility(
                              //     visible: signUpController.selectedRole.value == "Vendor",
                              //     child: Column(
                              //       children: [
                              //
                              //         CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //           plainTextString: "Restaurant Description",
                              //           plainTextStringFontSize: 20.sp(context),
                              //           plainTextStringFontWeight: FontWeight.w600,
                              //           plainTextContainerAlignment: Alignment.centerLeft,
                              //           plainTextStringColor: ColorUtils.white253,
                              //         ),
                              //
                              //         CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //         CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                              //           context: context,
                              //           controller: signUpController.restaurantDescriptionController.value,
                              //           hintText: "Enter description...",
                              //         ),
                              //       ],
                              //     )
                              // ),
                              //
                              //
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "Vendor" || signUpController.selectedRole.value == "User"
                              //       || signUpController.selectedRole.value == "Rider" || signUpController.selectedRole.value == "Broker",
                              //   child:  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              // ),
                              //
                              //
                              // /// contact for user, rider and vendor
                              // Visibility(
                              //     visible: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider"
                              //         || signUpController.selectedRole.value == "Vendor" || signUpController.selectedRole.value == "Broker",
                              //     child: Column(
                              //       children: [
                              //
                              //         CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //           plainTextString: "Email address",
                              //           plainTextStringFontSize: 20.sp(context),
                              //           plainTextStringFontWeight: FontWeight.w600,
                              //           plainTextContainerAlignment: Alignment.centerLeft,
                              //           plainTextStringColor: ColorUtils.white253,
                              //         ),
                              //
                              //         CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //         CustomTextFormFieldWidget().normalTextFormFiledWidgetWithIcon(
                              //           context: context,
                              //           controller: signUpController.emailController.value,
                              //           hintText: "Enter Email",
                              //           prefixIcon: const Icon(Icons.email_outlined,size: 24, color: Colors.black),
                              //         ),
                              //       ],
                              //     )
                              // ),
                              //
                              // CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              //
                              // /// contact for user, rider and vendor
                              // Visibility(
                              //     visible: signUpController.selectedRole.value == "User" || signUpController.selectedRole.value == "Rider" || signUpController.selectedRole.value == "Broker",
                              //     child: Column(
                              //       children: [
                              //
                              //         CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //           plainTextString: "Location",
                              //           plainTextStringFontSize: 20.sp(context),
                              //           plainTextStringFontWeight: FontWeight.w600,
                              //           plainTextContainerAlignment: Alignment.centerLeft,
                              //           plainTextStringColor: ColorUtils.white253,
                              //         ),
                              //
                              //         CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //         CustomTextFormFieldWidget().normalTextFormFiledWidgetWithIcon(
                              //           context: context,
                              //           controller: signUpController.locationController.value,
                              //           hintText: "Enter Location",
                              //           prefixIcon: const Icon(Icons.location_on_outlined,size: 24, color: Colors.black),
                              //         ),
                              //       ],
                              //     )
                              // ),
                              //
                              // /// contact for user, rider and vendor
                              // Visibility(
                              //     visible: signUpController.selectedRole.value == "Vendor",
                              //     child: Column(
                              //       children: [
                              //
                              //         CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //           plainTextString: "Location",
                              //           plainTextStringFontSize: 20.sp(context),
                              //           plainTextStringFontWeight: FontWeight.w600,
                              //           plainTextContainerAlignment: Alignment.centerLeft,
                              //           plainTextStringColor: ColorUtils.white253,
                              //         ),
                              //
                              //         CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //         CustomTextFormFieldWidget().normalTextFormFiledWidgetWithIcon(
                              //           context: context,
                              //           readOnly: true,
                              //           controller: signUpController.locationController.value,
                              //           hintText: "Enter Location",
                              //           prefixIcon: const Icon(Icons.location_on_outlined,size: 24, color: Colors.black),
                              //         ),
                              //       ],
                              //     )
                              // ),
                              //
                              //
                              // CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                            
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "User" ||
                              //       signUpController.selectedRole.value == "Rider" ||
                              //       signUpController.selectedRole.value == "Vendor" ||
                              //       signUpController.selectedRole.value == "Broker",
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       // Contact Field
                              //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //         plainTextString: "Contact",
                              //         plainTextStringFontSize: 20.sp(context),
                              //         plainTextStringFontWeight: FontWeight.w600,
                              //         plainTextContainerAlignment: Alignment.centerLeft,
                              //         plainTextStringColor: ColorUtils.white253,
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //       Container(
                              //         width: 428.w(context),
                              //         alignment: Alignment.center,
                              //         padding: EdgeInsets.symmetric(horizontal: 10.hpm(context)),
                              //         decoration: BoxDecoration(
                              //           color: ColorUtils.white253,
                              //           borderRadius: BorderRadius.circular(8.r(context)),
                              //         ),
                              //         child: Material( // Wrapping with Material
                              //           color: Colors.transparent, // Keep transparent if needed
                              //           child: InternationalPhoneNumberInput(
                              //             onInputChanged: (PhoneNumber number) {
                              //               signUpController.contact.value = number.phoneNumber.toString();
                              //             },
                              //             selectorConfig: const SelectorConfig(
                              //               selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              //               useEmoji: true,
                              //             ),
                              //             ignoreBlank: false,
                              //             autoValidateMode: AutovalidateMode.disabled,
                              //             selectorTextStyle: const TextStyle(color: Colors.black),
                              //             initialValue: PhoneNumber(isoCode: 'BD'),
                              //             formatInput: true,
                              //             inputDecoration: InputDecoration(
                              //               hintStyle: GoogleFonts.urbanist(
                              //                 fontWeight: FontWeight.w400,
                              //                 fontSize: 20.sp(context),
                              //                 color: ColorUtils.black114,
                              //               ),
                              //               border: InputBorder.none,
                              //               contentPadding: EdgeInsets.symmetric(vertical: 15),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //
                              //
                              //     ],
                              //   ),
                              // ),
                            
                            
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
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "User",
                              //   child:  Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              //
                              //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //         plainTextString: "Please upload documents to verify",
                              //         plainTextStringFontSize: 20.sp(context),
                              //         plainTextStringFontWeight: FontWeight.w600,
                              //         plainTextContainerAlignment: Alignment.centerLeft,
                              //         plainTextStringColor: ColorUtils.white253,
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //       CustomDottedWidget(
                              //         dottedColor: Colors.white,
                              //         textColor: Colors.white,
                              //         buttonColor: Colors.white,
                              //         lable: signUpController.documentFile.value.path.split('/').last,
                              //         onPress: () async {
                              //           FilePickerResult? result = await FilePicker.platform.pickFiles(
                              //             type: FileType.custom,
                              //             allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'svg'],
                              //           );
                              //           if (result != null) {
                              //             // The user has selected a file
                              //             PlatformFile file = result.files.first;
                              //             // Do something with the file (e.g., upload it)
                              //             print('File selected: ${file.name}');
                              //             signUpController.documentFile.value = File(file.path!);
                              //           } else {
                              //             CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                              //           }
                              //         },
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //
                              // /// document verify for rider
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "Rider",
                              //   child:  Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              //
                              //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //         plainTextString: "Upload driving license",
                              //         plainTextStringFontSize: 20.sp(context),
                              //         plainTextStringFontWeight: FontWeight.w600,
                              //         plainTextContainerAlignment: Alignment.centerLeft,
                              //         plainTextStringColor: ColorUtils.white253,
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //       CustomDottedWidget(
                              //           dottedColor: Colors.white,
                              //           buttonColor: Colors.white,
                              //           textColor: Colors.white,
                              //           lable: signUpController.drivingLicenceFile.value.path.split('/').last,
                              //           onPress: () async {
                              //             FilePickerResult? result = await FilePicker.platform.pickFiles(
                              //               type: FileType.custom,
                              //               allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'svg'],
                              //             );
                              //             if (result != null) {
                              //               // The user has selected a file
                              //               PlatformFile file = result.files.first;
                              //               // Do something with the file (e.g., upload it)
                              //               print('File selected: ${file.name}');
                              //               signUpController.drivingLicenceFile.value = File(file.path!);
                              //             } else {
                              //               CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                              //             }
                              //           }
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //
                              // /// Upload Cover Photo for Vendor
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "Vendor",
                              //   child:  Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              //
                              //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //         plainTextString: "Upload Cover Photo",
                              //         plainTextStringFontSize: 20.sp(context),
                              //         plainTextStringFontWeight: FontWeight.w600,
                              //         plainTextContainerAlignment: Alignment.centerLeft,
                              //         plainTextStringColor: ColorUtils.white253,
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //       CustomDottedWidget(
                              //           dottedColor: Colors.white,
                              //           buttonColor: Colors.white,
                              //           textColor: Colors.white,
                              //           lable: signUpController.coverFile.value.path.split('/').last,
                              //           onPress: () {
                              //             showDialog(
                              //               context: context,
                              //               builder: (BuildContext context) {
                              //                 return AlertDialog(
                              //                   title: Text('Select Profile Image'),
                              //                   content: Column(
                              //                     mainAxisSize: MainAxisSize.min,
                              //                     children: <Widget>[
                              //                       ListTile(
                              //                         leading: Icon(Icons.photo_library),
                              //                         title: Text('Gallery'),
                              //                         onTap: () async {
                              //                           final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                              //                           if (pickedFile != null) {
                              //                             print('Image selected: ${pickedFile.path}');
                              //                             signUpController.coverFile.value = File(pickedFile.path);
                              //                           } else {
                              //                             ScaffoldMessenger.of(context).showSnackBar(
                              //                               SnackBar(
                              //                                 content: Text('No image selected'),
                              //                                 duration: Duration(seconds: 2),
                              //                               ),
                              //                             );
                              //                           }
                              //                           Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                              //                         },
                              //                       ),
                              //                       ListTile(
                              //                         leading: Icon(Icons.camera_alt),
                              //                         title: Text('Camera'),
                              //                         onTap: () async {
                              //                           final pickedFile = await ImagePicker().pickImage(
                              //                               source: ImageSource.camera);
                              //                           if (pickedFile != null) {
                              //                             // Handle the picked image (e.g., update profile)
                              //                             signUpController.coverFile.value = File(pickedFile.path);
                              //                             print('Image selected: ${pickedFile.path}');
                              //                           } else {
                              //                             // Show a SnackBar if no image is selected before popping the dialog
                              //                             ScaffoldMessenger.of(context).showSnackBar(
                              //                               SnackBar(
                              //                                 content: Text('No image selected'),
                              //                                 duration: Duration(seconds: 2),
                              //                               ),
                              //                             );
                              //                           }
                              //                           Navigator.of(context).pop(); // Now safely pop the dialog after showing the SnackBar
                              //                         },
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 );
                              //               },
                              //             );
                              //           }
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //
                              // /// Upload Tax Document for Vendor
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "Vendor",
                              //   child:  Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              //
                              //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //         plainTextString: "Upload Tax Document",
                              //         plainTextStringFontSize: 20.sp(context),
                              //         plainTextStringFontWeight: FontWeight.w600,
                              //         plainTextContainerAlignment: Alignment.centerLeft,
                              //         plainTextStringColor: ColorUtils.white253,
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //
                              //       CustomDottedWidget(
                              //           dottedColor: Colors.white,
                              //           buttonColor: Colors.white,
                              //           textColor: Colors.white,
                              //           lable: signUpController.taxFile.value.path.split('/').last,
                              //           onPress: () async {
                              //             FilePickerResult? result = await FilePicker.platform.pickFiles(
                              //               type: FileType.custom,
                              //               allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'svg'],
                              //             );
                              //             if (result != null) {
                              //               // The user has selected a file
                              //               PlatformFile file = result.files.first;
                              //               // Do something with the file (e.g., upload it)
                              //               print('File selected: ${file.name}');
                              //               signUpController.taxFile.value = File(file.path!);
                              //             } else {
                              //               CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
                              //             }
                              //           }
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //
                              //
                              // Visibility(
                              //   visible: signUpController.selectedRole.value == "User" ||
                              //       signUpController.selectedRole.value == "Rider" ||
                              //       signUpController.selectedRole.value == "Vendor" ||
                              //       signUpController.selectedRole.value == "Broker",
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              //
                              //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //         plainTextString: "Enter Password",
                              //         plainTextStringFontSize: 20.sp(context),
                              //         plainTextStringFontWeight: FontWeight.w600,
                              //         plainTextContainerAlignment: Alignment.centerLeft,
                              //         plainTextStringColor: ColorUtils.white253,
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //       CustomTextFormFieldWidget().passwordTextFormFieldWidgetWithIcon(
                              //         context: context,
                              //         controller: signUpController.passwordController.value,
                              //         hintText: "Enter Password",
                              //         prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                              //         obscureText: !signUpController.isPasswordVisible.value,
                              //         suffixIcon: IconButton(
                              //           icon: Icon(
                              //             signUpController.isPasswordVisible.value
                              //                 ? Icons.visibility
                              //                 : Icons.visibility_off,
                              //           ),
                              //           onPressed: () async {
                              //             await signUpController.togglePasswordVisibility();
                              //           },
                              //         ),
                              //       ),
                              //
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                              //
                              //
                              //       CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //         plainTextString: "Enter Confirm Password",
                              //         plainTextStringFontSize: 20.sp(context),
                              //         plainTextStringFontWeight: FontWeight.w600,
                              //         plainTextContainerAlignment: Alignment.centerLeft,
                              //         plainTextStringColor: ColorUtils.white253,
                              //       ),
                              //
                              //       CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),
                              //
                              //       CustomTextFormFieldWidget().passwordTextFormFieldWidgetWithIcon(
                              //         context: context,
                              //         controller: signUpController.confirmPasswordController.value,
                              //         hintText: "Enter Confirm Password",
                              //         prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                              //         obscureText: !signUpController.isConfirmPasswordVisible.value,
                              //         suffixIcon: IconButton(
                              //           icon: Icon(
                              //             signUpController.isConfirmPasswordVisible.value
                              //                 ? Icons.visibility
                              //                 : Icons.visibility_off,
                              //           ),
                              //           onPressed: () async {
                              //             await signUpController.toggleConfirmPasswordVisibility();
                              //           },
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              //


                              CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                            
                            
                            
                              signUpController.isSubmit.value == true ?
                              Container(
                                height: 64.h(context),
                                width: 428.h(context),
                                decoration: const BoxDecoration(
                                    color: Colors.transparent
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(color: ColorUtils.white253,),
                                ),
                              ) :
                              CustomButtonContainer.plainButtonContainer(
                                plainButtonHeight: 64.h(context),
                                plainButtonWidth: 428.w(context),
                                plainButtonRadius: 8.r(context),
                                plainButtonOnPress:  () async {
                                  if(signUpController.selectedRole.value == "User") {
                                    if(signUpController.emailController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Email");
                                    }else if(signUpController.phoneNumber.value == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Contact Number");
                                    }else if(signUpController.firstNameController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your First Name");
                                    }else if(signUpController.lastNameController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Last Name");
                                    }else if(signUpController.locationController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Location");
                                    }else if(signUpController.passwordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Password");
                                    }else if(signUpController.confirmPasswordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Confirm Password");
                                    }else if(signUpController.confirmPasswordController.value.text != signUpController.passwordController.value.text) {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is Not Matching");
                                    } else {
                                      signUpController.isSubmit.value = true;
                                      await signUpController.getUserSignUpResponse(
                                        image: signUpController.imageFile.value,
                                        document: signUpController.documentFile.value,
                                        name: "${signUpController.firstNameController.value.text} ${signUpController.lastNameController.value.text}",
                                        password: signUpController.passwordController.value.text,
                                        email: signUpController.emailController.value.text,
                                        location: signUpController.locationController.value.text,
                                        contact: signUpController.phoneNumber.value,
                                        onSuccess: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                                          Get.off(()=>OtpVerifyScreen(email: signUpController.emailController.value.text, isSignUp: true),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                        },
                                        onFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                        onExceptionFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                      );
                                    }
                                  } else if(signUpController.selectedRole.value == "Rider") {
                                    if(signUpController.emailController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Email");
                                    }else if(signUpController.phoneNumber.value == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Contact Number");
                                    }else if(signUpController.drivingLicenceFile.value.path == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please upload your driving Licence Document");
                                    }else if(signUpController.firstNameController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your First Name");
                                    }else if(signUpController.lastNameController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Last Name");
                                    }else if(signUpController.locationController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Location");
                                    }else if(signUpController.passwordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Password");
                                    }else if(signUpController.confirmPasswordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Confirm Password");
                                    }else if(signUpController.confirmPasswordController.value.text != signUpController.passwordController.value.text) {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is Not Matching");
                                    } else {
                                      signUpController.isSubmit.value = true;
                                      await signUpController.getRiderSignUpResponse(
                                        image: signUpController.imageFile.value,
                                        document: signUpController.drivingLicenceFile.value,
                                        name: "${signUpController.firstNameController.value.text} ${signUpController.lastNameController.value.text}",
                                        password: signUpController.passwordController.value.text,
                                        email: signUpController.emailController.value.text,
                                        location: signUpController.locationController.value.text,
                                        contact: signUpController.phoneNumber.value,
                                        onSuccess: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                                          Get.off(()=>OtpVerifyScreen(email: signUpController.emailController.value.text, isSignUp: true),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                        },
                                        onFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                        onExceptionFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                      );
                                    }
                                  } else if(signUpController.selectedRole.value == "Vendor") {
                                    if(signUpController.restaurantNameController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Restaurant Name");
                                    }else if(signUpController.restaurantDescriptionController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Restaurant Description");
                                    }else if(signUpController.phoneNumber.value == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Contact Number");
                                    }else if(signUpController.taxFile.value.path == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please upload your tax Document");
                                    }else if(signUpController.locationController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Location");
                                    }else if(signUpController.passwordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Password");
                                    }else if(signUpController.confirmPasswordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Confirm Password");
                                    }else if(signUpController.confirmPasswordController.value.text != signUpController.passwordController.value.text) {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is Not Matching");
                                    } else {
                                      signUpController.isSubmit.value = true;
                                      await signUpController.getVendorSignUpResponse(
                                        coverImage: signUpController.coverFile.value,
                                        taxFile: signUpController.taxFile.value,
                                        restaurantName: signUpController.restaurantNameController.value.text,
                                        restaurantDescription: signUpController.restaurantDescriptionController.value.text,
                                        password: signUpController.passwordController.value.text,
                                        email: signUpController.emailController.value.text,
                                        location: signUpController.locationController.value.text,
                                        contact: signUpController.phoneNumber.value,
                                        onSuccess: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                                          Get.off(()=>OtpVerifyScreen(email: signUpController.emailController.value.text, isSignUp: true),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                        },
                                        onFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                        onExceptionFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                      );
                                    }
                                  } else {
                                    if(signUpController.imageFile.value.path == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Pick A Profile Image");
                                    } if(signUpController.emailController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Email");
                                    } else if(signUpController.firstNameController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your First Name");
                                    } else if(signUpController.phoneNumber.value == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Contact Number");
                                    } else if(signUpController.lastNameController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Last Name");
                                    } else if(signUpController.locationController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Location");
                                    } else if(signUpController.passwordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Password");
                                    } else if(signUpController.confirmPasswordController.value.text == "") {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Confirm Password");
                                    } else if(signUpController.confirmPasswordController.value.text != signUpController.passwordController.value.text) {
                                      CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is Not Matching");
                                    } else {
                                      signUpController.isSubmit.value = true;
                                      await signUpController.getBrokerSignUpResponse(
                                        image: signUpController.imageFile.value,
                                        name: "${signUpController.firstNameController.value.text},${signUpController.lastNameController.value.text}",
                                        password: signUpController.passwordController.value.text,
                                        email: signUpController.emailController.value.text,
                                        location: signUpController.locationController.value.text,
                                        contact: signUpController.phoneNumber.value,
                                        onSuccess: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                                          Get.off(()=>OtpVerifyScreen(email: signUpController.emailController.value.text, isSignUp: true),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                        },
                                        onFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                        onExceptionFail: (e) {
                                          signUpController.isSubmit.value = false;
                                          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                        },
                                      );
                                    }
                                  }
                                },
                                plainButtonHint: "Sign Up",
                                plainButtonHintFontSize: 22.sp(context),
                                plainButtonColor: ColorUtils.green176,
                                plainButtonHintFontColor: ColorUtils.white255,
                              ),
                            
                              CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                            
                            
                              CustomRichTextContainer.plainRichTextContainerWidgetWithoutWidthHeight(
                                  context: context,
                                  plainPrimaryTextStringAlign: TextAlign.center,
                                  plainPrimaryTextString: "Already have an account? ",
                                  plainRichTextStringFontSize: 20.sp(context),
                                  plainRichTextStringColor: ColorUtils.white253,
                                  plainRichTextStringFontWeight: FontWeight.w500,
                                  textSpanList: [
                                    TextSpan(
                                      text: "Log In",
                                      style: CustomRichTextContainer.plainRichTextStringStyleWithDecoration(
                                          context: context,
                                          plainRichTextStringFontSize: 20.sp(context),
                                          plainRichTextStringColor: ColorUtils.orange125,
                                          plainRichTextStringFontWeight: FontWeight.w600
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                        Get.off(()=>SignInView(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
