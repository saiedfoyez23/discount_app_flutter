import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_in_screen.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordWidget {

  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
  OtpVerifyController otpVerifyController = Get.put(OtpVerifyController());

  Widget forgotPasswordWidget({required BuildContext context}) {
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
              title: "Forgot Password",
              onPress: () async {
                Get.off(()=>const SignInScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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


                  CustomSpaceWidget.spacerWidget(spaceHeight: 88.h(context)),


                  CustomImageContainer.assetImageContainer(
                    height: 277.55.h(context),
                    width: 372.5.w(context),
                    assetImage: AppImages.forgotBg,
                    boxFit: BoxFit.fitWidth,
                  ),



                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),

                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "Select which contact details should we use to reset your password",
                    plainTextStringFontSize: 22.sp(context),
                    plainTextStringFontWeight: FontWeight.w500,
                    plainTextContainerAlignment: Alignment.centerLeft,
                    plainTextStringColor: AppColors.white253,
                    plainTextStringTextAlign: TextAlign.start,
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.hpm(context),
                      vertical: 24.vpm(context),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.white253,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        CustomImageContainer.assetImageContainer(
                          height: 80.h(context),
                          width: 80.w(context),
                          assetImage: AppImages.forgotPasswordScreenEmailImage,
                          boxFit: BoxFit.fitWidth,
                          boxShape: BoxShape.circle,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceWidth: 20.w(context)),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "via Email:",
                                plainTextStringFontSize: 17.sp(context),
                                plainTextStringFontWeight: FontWeight.w400,
                                plainTextContainerAlignment: Alignment.centerLeft,
                                plainTextStringColor: AppColors.white253,
                              ),


                              CustomTextFormFieldWidget().normalTextFormFiledWidget(
                                context: context,
                                controller: forgotPasswordController.emailController.value,
                                hintText: "example@email.com",
                              )


                            ],
                          ),
                        ),


                      ],
                    ),
                  ),



                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  forgotPasswordController.isSubmit.value == true ?
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
                      if(forgotPasswordController.emailController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Email");
                      }else{
                        forgotPasswordController.isSubmit.value = true;
                        Map<String,dynamic> data = {
                          "email": forgotPasswordController.emailController.value.text,
                        };
                        await ForgotPasswordController.getForgotPasswordResponse(
                          data: data,
                          onSuccess: (e) async {
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            Get.off(()=>OtpVerifyScreen(email: forgotPasswordController.emailController.value.text,isSignUp: false,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                            forgotPasswordController.isSubmit.value = false;
                          },
                          onFail: (e) {
                            forgotPasswordController.isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          onExceptionFail: (e) {
                            forgotPasswordController.isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                        );


                      }

                    },
                    plainButtonHint: "Verify",
                    plainButtonHintFontSize: 22.sp(context),
                    plainButtonColor: AppColors.green176,
                    plainButtonHintFontColor: AppColors.white255,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),




                ],
              ),
            ),
          )

        ],
      ),
    ));
  }


}

