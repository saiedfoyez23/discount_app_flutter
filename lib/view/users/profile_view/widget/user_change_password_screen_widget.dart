import 'package:discount_me_app/view/users/profile_view/widget/user_profile_appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/res/res.dart';

class UserChangePasswordScreenWidget extends GetxController {

  RxBool isSubmit = false.obs;

  Rx<TextEditingController> currentPasswordController = TextEditingController().obs;
  Rx<TextEditingController> newPasswordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;


  RxBool isCurrentPasswordVisible = false.obs;
  RxBool isNewPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;

  // Toggle functions
  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible.value = !isCurrentPasswordVisible.value;
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Widget userChangePasswordScreenWidget({required BuildContext context}) {
    return Obx(()=>Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppImages.homeBg),
          alignment: Alignment.topRight,
          opacity: 0.5,
        ),
      ),
      child: CustomScrollView(
        slivers: [


          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
              child: Column(
                children: [

                  CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                  UserProfileAppbarWidget(
                    title: "Change Password",
                    onTap: () {
                      Get.off(()=>UserProfileSettingScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                    },
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 50.h(context)),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.hpm(context),
                      vertical: 8.vpm(context),
                    ),
                    decoration: BoxDecoration(
                      color: ColorUtils.greenLight,
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock_outline, color: Colors.black54),
                        SizedBox(width: 16.w(context)),
                        Expanded(
                          child: TextField(
                            controller: currentPasswordController.value,
                            obscureText: !isCurrentPasswordVisible.value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Current Password',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isCurrentPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: toggleCurrentPasswordVisibility,
                        ),
                      ],
                    ),
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 8.vpm(context)),
                    decoration: BoxDecoration(
                      color: ColorUtils.greenLight,
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock_outline, color: Colors.black54),
                        SizedBox(width: 16.w(context)),
                        Expanded(
                          child: TextField(
                            controller: newPasswordController.value,
                            obscureText: !isNewPasswordVisible.value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'New Password',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isNewPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: toggleNewPasswordVisibility,
                        ),
                      ],
                    ),
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 8.vpm(context)),
                    decoration: BoxDecoration(
                      color: ColorUtils.greenLight,
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock_outline, color: Colors.black54),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: confirmPasswordController.value,
                            obscureText: !isConfirmPasswordVisible.value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm New Password',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: toggleConfirmPasswordVisibility,
                        ),
                      ],
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
                      plainButtonHintAlign: Alignment.centerLeft,
                      plainButtonHintTextAlign: TextAlign.start,
                      plainButtonHintFontSize: 18.sp(context),
                      plainButtonColor: Colors.transparent,
                      plainButtonHintFontColor: ColorUtils.orange125
                  ),


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
                      if(currentPasswordController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Current Password");
                      }else if(newPasswordController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your New Password");
                      }else if(confirmPasswordController.value.text == "") {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Enter Your Confirm Password");
                      }else if(newPasswordController.value.text != confirmPasswordController.value.text) {
                        CustomSnackBar().errorCustomSnackBar(context: context, message: "Password is Not Matching");
                      }else{
                        isSubmit.value = true;
                        await UserProfileEditController.updatePasswordResponse(
                          oldPassword: currentPasswordController.value.text,
                          newPassword: newPasswordController.value.text,
                          onSuccess: (e) async {
                            await AppLocalStorage.removeKey(key: "Login");
                            await Get.off(()=>const SignInScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                            isSubmit.value = false;
                          },
                          onFail: (e) {
                            isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                          onExceptionFail: (e) async {
                            if(e == "jwt expired") {
                              await AppLocalStorage.removeKey(key: "Login");
                              await Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                            }
                            isSubmit.value = false;
                            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                          },
                        );
                      }
                    },
                    plainButtonHint: "Confirm",
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
    ));
  }



}