import 'dart:io';
import 'dart:ui';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class BrokerSignUpScreenWidget {

  final BrokerSignUpController brokerSignUpController = Get.put(BrokerSignUpController());

  Widget brokerSignUpScreenWidget({required BuildContext context}) {
    return Obx(()=> Container(
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
              color: Color.fromRGBO(29, 36, 45, .53),
            ),
          ),


          Container(
            height: 926.h(context),
            width: 428.w(context),
            decoration: BoxDecoration(
              color: Colors.transparent,
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
                          height: 160.h(context),
                          width: 428.w(context),
                          curve: Curves.easeIn,
                          child:  Center(
                            child: Stack(
                              children: [
                                Container(
                                  height:120.h(context),
                                  width: 120.w(context),
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent
                                  ),
                                ),
                                Positioned(
                                  child: brokerSignUpController.imageFile.value.path == "" ? CustomImageContainer.assetImageContainer(
                                      height: 110.h(context),
                                      width: 110.w(context),
                                      assetImage: ImageUtils.imagePickerIcon,
                                      boxFit: BoxFit.fitWidth,
                                      boxShape: BoxShape.circle,
                                      borderColors: ColorUtils.green176,
                                      borderWidth: 1
                                  ) :
                                  CustomImageContainer.fileImageContainer(
                                      height: 110.h(context),
                                      width: 110.w(context),
                                      file: brokerSignUpController.imageFile.value,
                                      boxFit: BoxFit.fitWidth,
                                      boxShape: BoxShape.circle,
                                      borderColors: ColorUtils.green176,
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
                                                        brokerSignUpController.imageFile.value = File(pickedFile.path);
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
                                                        brokerSignUpController.imageFile.value = File(pickedFile.path);
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
                                        value: "Broker",
                                        groupValue: brokerSignUpController.selectedRole.value,
                                        onChanged: (value) async {
                                          brokerSignUpController.changeRole(value!);
                                        },
                                        fillColor: WidgetStateProperty.resolveWith<Color>(
                                              (Set<WidgetState> states) {
                                            return  brokerSignUpController.selectedRole.value == "Broker"
                                                ? ColorUtils.orange41
                                                : ColorUtils.white253;
                                          },
                                        ),
                                      ),
                                      CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                          plainTextString: "Broker",
                                          plainTextStringFontSize: 16.sp(context),
                                          plainTextStringFontWeight: FontWeight.w600,
                                          plainTextContainerAlignment: Alignment.centerLeft,
                                          plainTextStringColor: brokerSignUpController.selectedRole.value == "Broker"
                                              ? ColorUtils.orange41
                                              : ColorUtils.white253
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
                          visible: brokerSignUpController.selectedRole.value == "Broker",
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
                                      plainTextStringColor: ColorUtils.white253,
                                    ),

                                    CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                                    CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                                      context: context,
                                      controller: brokerSignUpController.firstNameController.value,
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
                                      plainTextStringColor: ColorUtils.white253,
                                    ),

                                    CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                                    CustomTextFormFieldWidget().normalTextFormFiledWidgetWithFillColor(
                                      context: context,
                                      controller: brokerSignUpController.lastNameController.value,
                                      hintText: "Last Name",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),



                        Visibility(
                            visible: brokerSignUpController.selectedRole.value == "Broker",
                            child: Column(
                              children: [

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: "Email address",
                                  plainTextStringFontSize: 20.sp(context),
                                  plainTextStringFontWeight: FontWeight.w600,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: ColorUtils.white253,
                                ),

                                CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                                CustomTextFormFieldWidget().normalTextFormFiledWidgetWithIcon(
                                  context: context,
                                  controller: brokerSignUpController.emailController.value,
                                  hintText: "Enter Email",
                                  prefixIcon: const Icon(Icons.email_outlined,size: 24, color: Colors.black),
                                ),
                              ],
                            )
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                        Visibility(
                            visible: brokerSignUpController.selectedRole.value == "Broker",
                            child: Column(
                              children: [

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: "Location",
                                  plainTextStringFontSize: 20.sp(context),
                                  plainTextStringFontWeight: FontWeight.w600,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: ColorUtils.white253,
                                ),

                                CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                                CustomTextFormFieldWidget().normalTextFormFiledWidgetWithIcon(
                                  context: context,
                                  controller: brokerSignUpController.locationController.value,
                                  hintText: "Enter Location",
                                  prefixIcon: const Icon(Icons.location_on_outlined,size: 24, color: Colors.black),
                                ),
                              ],
                            )
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        Visibility(
                          visible: brokerSignUpController.selectedRole.value == "Broker",
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Contact Field
                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "Contact",
                                plainTextStringFontSize: 20.sp(context),
                                plainTextStringFontWeight: FontWeight.w600,
                                plainTextContainerAlignment: Alignment.centerLeft,
                                plainTextStringColor: ColorUtils.white253,
                              ),

                              CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),


                              Container(
                                width: 428.w(context),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 10.hpm(context)),
                                decoration: BoxDecoration(
                                  color: ColorUtils.white253,
                                  borderRadius: BorderRadius.circular(8.r(context)),
                                ),
                                child: Material( // Wrapping with Material
                                  color: Colors.transparent, // Keep transparent if needed
                                  child: InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      brokerSignUpController.contact.value = number.phoneNumber.toString();
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
                                        color: ColorUtils.black114,
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

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        Visibility(
                          visible: brokerSignUpController.selectedRole.value == "Broker",
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "Enter Password",
                                plainTextStringFontSize: 20.sp(context),
                                plainTextStringFontWeight: FontWeight.w600,
                                plainTextContainerAlignment: Alignment.centerLeft,
                                plainTextStringColor: ColorUtils.white253,
                              ),

                              CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                              CustomTextFormFieldWidget().passwordTextFormFieldWidgetWithIcon(
                                context: context,
                                controller: brokerSignUpController.passwordController.value,
                                hintText: "Enter Password",
                                prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                                obscureText: !brokerSignUpController.isPasswordVisible.value,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    brokerSignUpController.isPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () async {
                                    await brokerSignUpController.togglePasswordVisibility();
                                  },
                                ),
                              ),


                              CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "Enter Confirm Password",
                                plainTextStringFontSize: 20.sp(context),
                                plainTextStringFontWeight: FontWeight.w600,
                                plainTextContainerAlignment: Alignment.centerLeft,
                                plainTextStringColor: ColorUtils.white253,
                              ),

                              CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                              CustomTextFormFieldWidget().passwordTextFormFieldWidgetWithIcon(
                                context: context,
                                controller: brokerSignUpController.confirmPasswordController.value,
                                hintText: "Enter Confirm Password",
                                prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                                obscureText: !brokerSignUpController.isConfirmPasswordVisible.value,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    brokerSignUpController.isConfirmPasswordVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () async {
                                    await brokerSignUpController.toggleConfirmPasswordVisibility();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        brokerSignUpController.isSubmit.value == true ?
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
                            if(brokerSignUpController.emailController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Email");
                            } else if(brokerSignUpController.firstNameController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your First Name");
                            } else if(brokerSignUpController.contact.value == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Contact Number");
                            } else if(brokerSignUpController.lastNameController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Last Name");
                            } else if(brokerSignUpController.locationController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Location");
                            } else if(brokerSignUpController.passwordController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Password");
                            } else if(brokerSignUpController.confirmPasswordController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Confirm Password");
                            } else if(brokerSignUpController.confirmPasswordController.value.text != brokerSignUpController.passwordController.value.text) {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is Not Matching");
                            } else {
                              brokerSignUpController.isSubmit.value = true;
                              await brokerSignUpController.getBrokerSignUpResponse(
                                image: brokerSignUpController.imageFile.value,
                                name: "${brokerSignUpController.firstNameController.value.text} ${brokerSignUpController.lastNameController.value.text}",
                                password: brokerSignUpController.passwordController.value.text,
                                email: brokerSignUpController.emailController.value.text,
                                location: brokerSignUpController.locationController.value.text,
                                contact: brokerSignUpController.contact.value,
                                onSuccess: (e) {
                                  brokerSignUpController.isSubmit.value = false;
                                  CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                                  Get.off(()=>OtpVerifyScreen(email: brokerSignUpController.emailController.value.text, isSignUp: true),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                },
                                onFail: (e) {
                                  brokerSignUpController.isSubmit.value = false;
                                  CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                },
                                onExceptionFail: (e) {
                                  brokerSignUpController.isSubmit.value = false;
                                  CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                },
                              );
                            }
                          },
                          plainButtonHint: "Sign Up",
                          plainButtonHintFontSize: 22.sp(context),
                          plainButtonColor: ColorUtils.green176,
                          plainButtonHintFontColor: ColorUtils.white255,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),





                      ],
                    ),
                  ),
                )


              ],
            ),
          ),
        ],
      ),
    ));
  }



}