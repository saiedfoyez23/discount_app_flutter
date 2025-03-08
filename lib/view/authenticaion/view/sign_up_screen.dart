// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/common_widget/custom_dotted_widget.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/view/authenticaion/controller/radio_button_controller.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_up_preview_screen.dart';
import 'package:discount_me_app/view/authenticaion/widget/password_widget.dart';
import 'package:discount_me_app/view/authenticaion/widget/user_type_widget.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/gestures.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreen extends StatelessWidget {
  final RadioController radioController = Get.put(RadioController());
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // This list holds US civil services and official positions.
    // final List<String> _positions = [
    //   'Federal Government Official',
    //   'State Government Official',
    //   'City Council Member',
    //   'Mayor',
    //   'Senator',
    //   'Congressperson',
    //   'Police Officer',
    //   'Firefighter',
    //   'Public School Teacher',
    //   'Healthcare Worker',
    //   'Other'
    // ];
    // Initial selected value
    //String? _selectedPosition;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.authBg),
              fit: BoxFit.fill,
              opacity: 0.3,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // app bar
                  CustomAppBar(
                    appBarName: "Create Account",
                    onTap: () {
                      Get.back();
                    },
                  ),


                  /// pick image
                  20.heightBox,
                 AnimatedContainer(
                   duration: Duration(seconds: 5),
                   width: width,
                   curve: Curves.easeIn,
                   child:Obx(() => Visibility(
                     visible: radioController.selectedRole.value == "User" || radioController.selectedRole.value == "Rider",
                     child: Center(
                       child: Stack(
                         children: [
                           Image.asset(
                             AppImages.imagePickerIcon,
                             scale: 4.w.h,
                           ),
                           Positioned(
                             bottom: 0,
                             right: 0,
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
                               child: Container(
                                 width: 40,
                                 height: 40,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(50),
                                 ),
                                 child: Icon(
                                   Icons.camera_alt_outlined,
                                   color: AppColors.secondaryColor,
                                   size: 28.w.h,
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   ),),
                 ),



                  /// UserTypeWidget to select the user role
                  20.heightBox,
                  UserTypeWidget(),

                  /// get details
                  20.heightBox,
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child: Column(
                      children: [
                        radioController.selectedRole.value == "Vendor"?
                        CustomTextfieldWithLabel(
                          labelName: "Restaurant Name",
                          hint: 'Kings food',
                          controller: signUpController.restaurantNameController.value,
                        ) :
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextfieldWithLabel(
                                labelName: "First name",
                                hint: "Ryan",
                                controller: signUpController.firstNameController.value,
                              ),
                            ),
                            10.widthBox,
                            Expanded(
                              child: CustomTextfieldWithLabel(
                                labelName: "Last name",
                                hint: "Renold",
                                controller: signUpController.lastNameController.value,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),),


                  /// resturant description for vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Vendor",
                    child: CustomTextfieldWithLabel(
                      labelName: "Restaurant Description",
                      hint: 'Enter description...',
                      controller: signUpController.restaurantDescriptionController.value,
                    ),
                  ),),

                  /// contact for user, rider and vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                      radioController.selectedRole.value == "Vendor",
                    child: CustomTextfieldWithLabel(
                      labelName: "Email address",
                      hint: 'abc@gmail.com',
                      prefixIcon: Icon(Icons.email_outlined),
                      controller: signUpController.emailController.value,
                    ),
                  ),),

                  /// contact for user, rider and vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child: CustomTextfieldWithLabel(
                      labelName: "Location",
                      hint: 'New york, usa',
                      prefixIcon: Icon(Icons.location_on_outlined),
                      controller: signUpController.locationController.value,
                    ),
                  ),),

                  /// contact for user, rider and vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Contact Field
                        CustomText(
                          title: "Contact",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),

                        SizedBox(height: 10.h),

                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Material( // Wrapping with Material
                            color: Colors.transparent, // Keep transparent if needed
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                signUpController.contact.value = number.phoneNumber.toString();
                              },
                              selectorConfig: SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                useEmoji: true,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: const TextStyle(color: Colors.black),
                              initialValue: PhoneNumber(isoCode: 'BD'),
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
                  ),),

                  /// Ebt holder for user
                  //20.heightBox,
                  // Obx(() => Visibility(
                  //   visible: radioController.selectedRole.value == "User",
                  //   child:   Column(
                  //     children: [
                  //       CustomText(
                  //         title: "Are you a first responder or EBT card holder?(Optional)",
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18,
                  //         color: Colors.white,
                  //       ),
                  //       10.heightBox,
                  //       DropdownButtonFormField<String>(
                  //         value: _selectedPosition,
                  //         dropdownColor: Colors.white,  // Dropdown menu background color
                  //         style: TextStyle(
                  //           color: Colors.black,  // Selected item text color
                  //         ),
                  //         hint: Text(
                  //           'Select an option',
                  //           style: TextStyle(color: Colors.black),  // Hint text color
                  //         ),
                  //         items: _positions.map((position) {
                  //           return DropdownMenuItem(
                  //             value: position,
                  //             child: Text(
                  //               position,
                  //               style: TextStyle(color: Colors.black),  // Dropdown item text color
                  //             ),
                  //           );
                  //         }).toList(),
                  //         onChanged: (newValue) {
                  //           _selectedPosition = newValue;
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
                  //               borderRadius: BorderRadius.all(Radius.circular(8.r))
                  //           ),
                  //           contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),),


                  /// document verify for user
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.heightBox,
                        CustomText(
                          title: "Please upload documents to verify",
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                        10.heightBox,
                        CustomDottedWidget(
                          dottedColor: Colors.white,
                          textColor: Colors.white,
                          buttonColor: Colors.white,
                          onTap: () async {
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('No file selected'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),),

                  /// document verify for rider
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Rider",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Upload driving license",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                        10.heightBox,
                        CustomDottedWidget(
                            dottedColor: Colors.white,
                            buttonColor: Colors.white,
                            textColor: Colors.white,
                            onTap: () async {
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('No file selected'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                        ),
                      ],
                    ),
                  ),),

                 /// Upload Cover Photo for Vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Vendor",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Upload Cover Photo",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                        10.heightBox,
                        CustomDottedWidget(
                            dottedColor: Colors.white,
                            buttonColor: Colors.white,
                            textColor: Colors.white,
                            onTap: () {
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
                  ),),

                  /// Upload Cover Photo for Vendor
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "Vendor",
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.heightBox,
                        CustomText(
                          title: "Upload Tax Document",
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.whiteColor,
                        ),
                        10.heightBox,
                        CustomDottedWidget(
                            dottedColor: Colors.white,
                            buttonColor: Colors.white,
                            textColor: Colors.white,
                            onTap: () async {
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('No file selected'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            }
                        ),
                      ],
                    ),
                  ),),

                  /// contact for user and rider and vendor
                  20.heightBox,
                  Obx(() => Visibility(
                    visible: radioController.selectedRole.value == "User" ||
                        radioController.selectedRole.value == "Rider" ||
                        radioController.selectedRole.value == "Vendor",
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "Password",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(height: 10),
                        // Password Field
                        Obx(() => TextField(
                          controller: signUpController.passwordController.value,
                          obscureText: !signUpController.isPasswordVisible.value,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "************",
                            fillColor: AppColors.whiteColor,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
                                borderRadius: BorderRadius.circular(8.r)
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                signUpController.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: signUpController.togglePasswordVisibility,
                            ),
                          ),
                        ),
                        ),

                        SizedBox(height: 20),

                        // Confirm Password Field
                        CustomText(
                          title: "Confirm Password",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(height: 10),
                        Obx(() => TextField(
                          obscureText: !signUpController.isConfirmPasswordVisible.value,
                          controller: signUpController.confirmPasswordController.value,
                          decoration: InputDecoration(
                            hintText: "************",
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: AppColors.secondaryColor),
                                borderRadius: BorderRadius.circular(8.r)
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                signUpController.isConfirmPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: signUpController.toggleConfirmPasswordVisibility,
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),),



                  // Sign Up Button
                  20.heightBox,
                  Roundbutton(
                    title: 'Sign Up',
                    onTap: () {
                      print(signUpController.documentFile.value);
                      print(signUpController.contact.value);
                      print(signUpController.imageFile.value);
                      //Get.to(()=>SignUpPreviewScreen(),);
                    },
                  ),
                  20.heightBox,

                  Center(
                    child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Already have an account? ',
                                  style: GoogleFonts.urbanist(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white
                                  )
                              ),
                              TextSpan(
                                text: 'Log In',
                                style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.secondaryColor
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(()=>SignInScreen());
                                  },
                              )
                            ]
                        )
                    ),
                  ),

                  heightBox20

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
