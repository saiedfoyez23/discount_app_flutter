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
                                    await signUpController.checkLocationPermission(context: context);
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

                              SpaceHelperWidget.v(20.h(context)),

                              signUpController.isSubmit.value == true ?
                              LoadingHelperWidget.loadingHelperWidget(
                                context: context,
                              ) :
                              ButtonHelperWidget.customButtonWidget(
                                context: context,
                                onPressed: () async {
                                  final role = signUpController.selectedRole.value;

                                  String? error = _validateForm(role);

                                  if (error != null) {
                                    MessageSnackBarWidget.errorSnackBarWidget(context: context, message: error);
                                    return;
                                  }

                                  signUpController.isSubmit.value = true;

                                  try {
                                    switch (role) {
                                      case "User":
                                        await signUpController.getUserSignUpResponse(
                                          image: signUpController.imageFile.value,
                                          document: signUpController.documentFile.value,
                                          data: _commonUserData(),
                                          context: context,
                                        );
                                        break;

                                      case "Rider":
                                        await signUpController.getRiderSignUpResponse(
                                          image: signUpController.imageFile.value,
                                          document: signUpController.drivingLicenceFile.value,
                                          data: _commonUserData(),
                                          context: context,
                                        );
                                        break;

                                      case "Vendor":
                                        await signUpController.getVendorSignUpResponse(
                                          coverImage: signUpController.coverFile.value,
                                          taxFile: signUpController.taxFile.value,
                                          data: _vendorData(),
                                          context: context,
                                        );
                                        break;
                                      default:
                                        await signUpController.getBrokerSignUpResponse(
                                          data: _brokerData(),
                                          profileImageFile: signUpController.imageFile.value,
                                          context: context,
                                        );
                                    }
                                  } catch (e) {
                                    signUpController.isSubmit.value = false;
                                  }
                                },
                                text: "Sign Up",
                                borderRadius: 8,
                                backgroundColor: ColorUtils.primaryColor,
                                fontWeight: FontWeight.w700,
                                textColor: ColorUtils.white255,
                              ),

                              SpaceHelperWidget.v(20.h(context)),


                              RichTextHelperWidget.headingRichText(
                                context: context,
                                alignment: Alignment.center,
                                textAlign: TextAlign.center,
                                textSpans: [
                                  CustomTextSpan(
                                    text: "Already have an account? ",
                                    fontSize: 20,
                                    color: ColorUtils.white253,
                                    fontWeight: FontWeight.w500,
                                  ).toTextSpan(),
                                  CustomTextSpan(
                                    text: "Log In",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: ColorUtils.orange125,
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      Get.off(()=>SignInView(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                    },
                                  ).toTextSpan(),
                                ],
                              ),

                              SpaceHelperWidget.v(40.h(context)),
                            
                            
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


  String? _validateForm(String role) {
    final c = signUpController;

    // Common validations
    if (c.emailController.value.text.isEmpty) return "Please Enter Your Email";
    if (c.phoneNumber.value.isEmpty) return "Please Enter Your Contact Number";
    if (c.locationController.value.text.isEmpty) return "Please Enter Your Location";
    if (c.passwordController.value.text.isEmpty) return "Please Enter Your Password";
    if (c.confirmPasswordController.value.text.isEmpty) return "Please Enter Your Confirm Password";
    if (c.confirmPasswordController.value.text != c.passwordController.value.text) {
      return "Password is Not Matching";
    }

    // Role-specific validations
    switch (role) {
      case "User":
        if (c.firstNameController.value.text.isEmpty) return "Please Enter Your First Name";
        if (c.lastNameController.value.text.isEmpty) return "Please Enter Your Last Name";
        if (c.documentFile.value.path.isEmpty) {
          return "Please upload your document file to verify";
        }
        break;

      case "Rider":
        if (c.drivingLicenceFile.value.path.isEmpty) {
          return "Please upload your driving Licence Document";
        }
        if (c.firstNameController.value.text.isEmpty) return "Please Enter Your First Name";
        if (c.lastNameController.value.text.isEmpty) return "Please Enter Your Last Name";
        break;

      case "Vendor":
        if (c.restaurantNameController.value.text.isEmpty) return "Please Enter Your Restaurant Name";
        if (c.restaurantDescriptionController.value.text.isEmpty) return "Please Enter Your Restaurant Description";
        if (c.taxFile.value.path.isEmpty) return "Please upload your tax Document";
        break;

      default:
        if (c.imageFile.value.path.isEmpty) return "Please Pick A Profile Image";
        if (c.firstNameController.value.text.isEmpty) return "Please Enter Your First Name";
        if (c.lastNameController.value.text.isEmpty) return "Please Enter Your Last Name";
    }

    return null;
  }


  Map<String, dynamic> _commonUserData() {
    final c = signUpController;

    return {
      "name": "${c.firstNameController.value.text},${c.lastNameController.value.text}",
      "password": c.passwordController.value.text,
      "email": c.emailController.value.text,
      "location": c.locationController.value.text,
      "contact": c.phoneNumber.value,
      "broker_referral": c.referralCodeController.value.text,
    };
  }


  Map<String, dynamic> _brokerData() {
    final c = signUpController;

    return {
      "name": "${c.firstNameController.value.text},${c.lastNameController.value.text}",
      "password": c.passwordController.value.text,
      "email": c.emailController.value.text,
      "location": c.locationController.value.text,
      "contact": c.phoneNumber.value,
    };
  }


  Map<String, dynamic> _vendorData() {
    final c = signUpController;

    return {
      "email": c.emailController.value.text,
      "password": c.passwordController.value.text,
      "store_name": c.restaurantNameController.value.text,
      "store_description": c.restaurantDescriptionController.value.text,
      "contact": c.phoneNumber.value,
      "broker_referral": c.referralCodeController.value.text,
      "location": {
        "coordinates": [
          double.parse(c.long.value),
          double.parse(c.lat.value)
        ]
      }
    };
  }



}
