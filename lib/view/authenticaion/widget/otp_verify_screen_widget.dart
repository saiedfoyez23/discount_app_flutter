import 'dart:convert';

import 'package:discount_me_app/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:google_fonts/google_fonts.dart';


class OtpVerifyScreenWidget {

  OtpVerifyController otpVerifyController = Get.put(OtpVerifyController());


  Widget otpVerifyScreenWidget({required BuildContext context,required String email}) {
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
            title: "Otp Verify",
            onPress: () async {
              Get.off(()=>const ForgotPasswordScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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


                  CustomSpaceWidget.spacerWidget(spaceHeight: 88.h(context)),


                  CustomImageContainer.assetImageContainer(
                    height: 270.4.h(context),
                    width: 274.w(context),
                    assetImage: AppImages.otpBg,
                    boxFit: BoxFit.fitWidth,
                  ),



                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),

                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "Code has been send to ${email}",
                    plainTextStringFontSize: 22.sp(context),
                    plainTextStringFontWeight: FontWeight.w500,
                    plainTextContainerAlignment: Alignment.center,
                    plainTextStringColor: AppColors.white253,
                    plainTextStringTextAlign: TextAlign.center,
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      CustomTextFormFieldWidget().otpTextFormFieldWidget(
                        context: context,
                        controller: otpVerifyController.otp1.value,
                        onChange: (pin) {
                          if (pin.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),

                      CustomTextFormFieldWidget().otpTextFormFieldWidget(
                        context: context,
                        controller: otpVerifyController.otp2.value,
                        onChange: (pin) {
                          if (pin.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),

                      CustomTextFormFieldWidget().otpTextFormFieldWidget(
                        context: context,
                        controller: otpVerifyController.otp3.value,
                        onChange: (pin) {
                          if (pin.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),

                      CustomTextFormFieldWidget().otpTextFormFieldWidget(
                        context: context,
                        controller: otpVerifyController.otp4.value,
                        onChange: (pin) {
                          if (pin.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),

                      CustomTextFormFieldWidget().otpTextFormFieldWidget(
                        context: context,
                        controller: otpVerifyController.otp5.value,
                        onChange: (pin) {
                          if (pin.isNotEmpty) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),


                      CustomTextFormFieldWidget().otpTextFormFieldWidget(
                        context: context,
                        controller: otpVerifyController.otp6.value,
                        onChange: (pin) {
                          if (pin.isNotEmpty) {
                            FocusScope.of(context).unfocus();
                          }
                        },
                      ),




                    ],
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  otpVerifyController.timeCounter.value != 0 ?
                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "Resend code in ${otpVerifyController.timeCounter.value} s",
                    plainTextStringFontSize: 22.sp(context),
                    plainTextStringFontWeight: FontWeight.w500,
                    plainTextContainerAlignment: Alignment.center,
                    plainTextStringColor: AppColors.white253,
                    plainTextStringTextAlign: TextAlign.center,
                  ) :
                  Container(
                    height: 64.h(context),
                    width: 428.h(context),
                    decoration: const BoxDecoration(
                        color: Colors.transparent
                    ),
                    child: otpVerifyController.isReset.value == true ?
                    Container(
                      height: 64.h(context),
                      width: 428.h(context),
                      decoration: const BoxDecoration(
                          color: Colors.transparent
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(color: AppColors.white253,),
                      ),
                    ) : CustomButtonContainer.plainButtonContainer(
                      plainButtonHeight: 64.h(context),
                      plainButtonWidth: 428.w(context),
                      plainButtonRadius: 8.r(context),
                      plainButtonOnPress:  () async {
                        otpVerifyController.isReset.value = true;
                        Map<String,dynamic> data = {
                          "email": email,
                        };
                        await OtpVerifyController.getResetOtpResponse(
                          data: data,
                          onSuccess: (e) async {
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            Get.off(()=>OtpVerifyScreen(email: email,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                            otpVerifyController.isReset.value = false;
                          },
                          onFail: (e) {
                            otpVerifyController.isReset.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          onExceptionFail: (e) {
                            otpVerifyController.isReset.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                        );
                      },
                      plainButtonHint: "Resend Otp",
                      plainButtonHintAlign: Alignment.center,
                      plainButtonHintTextAlign: TextAlign.center,
                      plainButtonHintFontSize: 18.sp(context),
                      plainButtonColor: Colors.transparent,
                      plainButtonHintFontColor: AppColors.orange125,
                    ),
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  otpVerifyController.isSubmit.value == true ?
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
                      if(otpVerifyController.otp1.value.text == "" || otpVerifyController.otp2.value.text == "" ||
                          otpVerifyController.otp3.value.text == "" || otpVerifyController.otp4.value.text == "" ||
                          otpVerifyController.otp5.value.text == "" || otpVerifyController.otp6.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please fill the otp");
                      } else {
                        otpVerifyController.isSubmit.value = true;
                        Map<String,dynamic> data = {
                          "email": email,
                          "otp": "${otpVerifyController.otp1.value.text}${otpVerifyController.otp2.value.text}${otpVerifyController.otp3.value.text}${otpVerifyController.otp4.value.text}${otpVerifyController.otp5.value.text}${otpVerifyController.otp6.value.text}"
                        };
                        await OtpVerifyController.getVerifyOtpResponse(
                          data: data,
                          onSuccess: (e) async {
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            Get.off(()=>CreateNewPasswordScreen(email: email,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                            otpVerifyController.isSubmit.value = false;
                          },
                          onFail: (e) {
                            otpVerifyController.isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          onExceptionFail: (e) {
                            otpVerifyController.isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                        );
                      }
                    },
                    plainButtonHint: "Confirm",
                    plainButtonHintFontSize: 22.sp(context),
                    plainButtonColor: AppColors.green176,
                    plainButtonHintFontColor: AppColors.white255,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                ],
              ),
            ),
          )





        ],
      ),
    ));
  }




}