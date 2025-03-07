import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreenWidget {

  SignInController signInController = Get.put(SignInController());

  Widget signInScreenWidget({required BuildContext context}) {
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
              title: "Login Account",
              onPress: () async {
                Get.off(()=>const WelcomeScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
              }
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



                  CustomImageContainer.assetImageContainer(
                    height: 365.h(context),
                    width: 364.w(context),
                    assetImage: AppImages.loginBg,
                    boxFit: BoxFit.contain,
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "Glad to meet  you again!",
                    plainTextStringFontSize: 27.sp(context),
                    plainTextStringFontWeight: FontWeight.w700,
                    plainTextContainerAlignment: Alignment.center,
                    plainTextStringColor: AppColors.white253,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


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
                    controller: signInController.emailController.value,
                    hintText: "Enter Email",
                    prefixIcon: const Icon(Icons.email_outlined,size: 24, color: Colors.black),
                  ),



                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "Password",
                    plainTextStringFontSize: 20.sp(context),
                    plainTextStringFontWeight: FontWeight.w600,
                    plainTextContainerAlignment: Alignment.centerLeft,
                    plainTextStringColor: AppColors.white253,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                  CustomTextFormFieldWidget().passwordTextFormFieldWidgetWithIcon(
                    context: context,
                    controller: signInController.passwordController.value,
                    hintText: "Enter Password",
                    prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                    obscureText: !signInController.isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        signInController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () async {
                        await signInController.togglePasswordVisibility();
                      },
                    ),
                  ),




                  CustomButtonContainer.plainButtonContainer(
                      plainButtonHeight: 64.h(context),
                      plainButtonWidth: 428.w(context),
                      plainButtonRadius: 8.r(context),
                      plainButtonOnPress:  () async {
                        Get.off(()=>const ForgotPasswordScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                      },
                      plainButtonHint: "Forgot the password?",
                      plainButtonHintAlign: Alignment.centerRight,
                      plainButtonHintTextAlign: TextAlign.end,
                      plainButtonHintFontSize: 18.sp(context),
                      plainButtonColor: Colors.transparent,
                      plainButtonHintFontColor: AppColors.orange125
                  ),




                  signInController.isSubmit.value == true ?
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
                      if(signInController.emailController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Email");
                      }else if(signInController.passwordController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Password");
                      }else{
                        signInController.isSubmit.value = true;
                        print(signInController.emailController.value.text);
                        print(signInController.passwordController.value.text);
                        Map<String,dynamic> data = {
                          "email": signInController.emailController.value.text,
                          "password": signInController.passwordController.value.text,
                        };
                        await SignInController.getUserLoginResponse(
                          data: data,
                          onSuccess: (e,role) async {
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            if(role == "user") {
                              Get.off(()=>UserHome(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                              signInController.isSubmit.value = false;
                            }
                          },
                          onFail: (e) {
                            signInController.isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          onExceptionFail: (e) {
                            signInController.isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                        );


                      }

                    },
                    plainButtonHint: "Log in",
                    plainButtonHintFontSize: 22.sp(context),
                    plainButtonColor: AppColors.green176,
                    plainButtonHintFontColor: AppColors.white255,
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                  CustomRichTextContainer.plainRichTextContainerWidgetWithoutWidthHeight(
                      context: context,
                      plainPrimaryTextStringAlign: TextAlign.center,
                      plainPrimaryTextString: "Don't have an account? ",
                      plainRichTextStringFontSize: 20.sp(context),
                      plainRichTextStringColor: AppColors.white253,
                      plainRichTextStringFontWeight: FontWeight.w500,
                      textSpanList: [
                        TextSpan(
                          text: "Sign up",
                          style: CustomRichTextContainer.plainRichTextStringStyleWithDecoration(
                              context: context,
                              plainRichTextStringFontSize: 20.sp(context),
                              plainRichTextStringColor:AppColors.orange125,
                              plainRichTextStringFontWeight: FontWeight.w600
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.off(()=>SignUpScreen(), duration: const Duration(milliseconds: 100),preventDuplicates: false);
                          },
                        ),
                      ]
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 50.h(context)),

                ],
              ),
            ),
          )


        ],
      ),
    ));
  }



}