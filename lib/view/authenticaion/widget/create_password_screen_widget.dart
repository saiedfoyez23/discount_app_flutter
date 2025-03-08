import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/authenticaion/view/otp_verify_screen.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePasswordScreenWidget {

  CreatePasswordController createPasswordController = Get.put(CreatePasswordController());

  Widget createPasswordScreenWidget({required BuildContext context,required String email}) {
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
            title: "Create New Password",
            onPress: () async {
              Get.off(()=> OtpVerifyScreen(email: email,isSignUp: false,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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


                  CustomSpaceWidget.spacerWidget(spaceHeight: 45.h(context)),


                  CustomImageContainer.assetImageContainer(
                    height: 308.h(context),
                    width: 302.w(context),
                    assetImage: AppImages.createPassBg,
                    boxFit: BoxFit.fitWidth,
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


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
                    controller: createPasswordController.passwordController.value,
                    hintText: "Enter Password",
                    prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                    obscureText: !createPasswordController.isNewPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        createPasswordController.isNewPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () async {
                        await createPasswordController.toggleNewPasswordVisibility();
                      },
                    ),
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


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
                    controller: createPasswordController.confirmPasswordController.value,
                    hintText: "Enter Confirm Password",
                    prefixIcon: const Icon(Icons.lock_outline, size: 24, color: Colors.black,),
                    obscureText: !createPasswordController.isNewConfirmPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        createPasswordController.isNewConfirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () async {
                        await createPasswordController.toggleNewConfirmPasswordVisibility();
                      },
                    ),
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  createPasswordController.isSubmit.value == true ?
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
                      if(createPasswordController.passwordController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Password");
                      }else if(createPasswordController.confirmPasswordController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Confirm Password");
                      }else if(createPasswordController.confirmPasswordController.value.text != createPasswordController.passwordController.value.text) {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is Not Matching");
                      }else{
                        createPasswordController.isSubmit.value = true;
                        Map<String,dynamic> data = {
                          "email": email,
                          "password": createPasswordController.passwordController.value.text
                        };
                        await CreatePasswordController.getResetPasswordResponse(
                          data: data,
                          onSuccess: (e) async {
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            Get.off(()=>const SignInScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                            createPasswordController.isSubmit.value = false;
                          },
                          onFail: (e) {
                            createPasswordController.isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          onExceptionFail: (e) {
                            createPasswordController.isSubmit.value = false;
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