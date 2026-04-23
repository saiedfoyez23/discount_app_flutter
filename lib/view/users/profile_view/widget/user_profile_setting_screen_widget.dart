import 'package:discount_me_app/view/users/profile_view/view/user_change_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/res/res.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../res/common_widget/custom_alert_dialog.dart';

class UserProfileSettingScreenWidget extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;

  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  BuildContext context;
  UserProfileSettingScreenWidget({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await UserProfileController.getUserProfileApiService(
        onSuccess: (e) {
          isLoading.value = false;
          userProfileResponseModel.value = UserProfileResponseModel.fromJson(e);
        },
        onFail: (e) {
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
        },
        onExceptionFail: (e) async {
          if(e == "jwt expired") {
            await AppLocalStorage.removeKey(key: "Login");
            await Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
          }
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
        },
      );
    });
  }



  Widget userProfileSettingScreenWidget({required BuildContext context}) {
    return Obx(()=>Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(ImageUtils.homeBg),
          alignment: Alignment.topRight,
          opacity: 0.5,
        ),
      ),
      child: Skeletonizer(
        effect: PulseEffect(),
        enabled: isLoading.value,
        child: CustomScrollView(
          slivers: [


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                child: Column(
                  children: [


                    CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                    UserProfileAppbarWidget(
                      title: "Setting",
                      onTap: () {
                        Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                      },
                    ),

                    CustomSpaceWidget.spacerWidget(spaceHeight: 50.h(context)),


                    Container(
                      width: 428.w(context),
                      height: 80.h(context),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.vpm(context),
                        horizontal: 15.hpm(context),
                      ),
                      decoration: BoxDecoration(
                        color: ColorUtils.greenLight,
                        borderRadius: BorderRadius.circular(4.r(context)),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          Get.off(()=>UserChangePasswordScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.lock_outline, color: Colors.black,size: 30.r(context),),

                                  CustomSpaceWidget.spacerWidget(spaceWidth: 15.w(context)),

                                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                    plainTextString: "Change Password",
                                    plainTextStringFontSize: 16.sp(context),
                                    plainTextStringFontWeight: FontWeight.w500,
                                    plainTextContainerAlignment: Alignment.centerLeft,
                                    plainTextStringTextAlign: TextAlign.start,
                                    plainTextStringColor: Color(0xff727272),
                                  ),

                                ],
                              ),
                            ),

                            Icon(Icons.navigate_next, size: 24,)

                          ],
                        ),
                      ),
                    ),

                    CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                    Container(
                      width: 428.w(context),
                      height: 80.h(context),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.vpm(context),
                        horizontal: 15.hpm(context),
                      ),
                      decoration: BoxDecoration(
                        color: ColorUtils.greenLight,
                        borderRadius: BorderRadius.circular(4.r(context)),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "Delete Account",
                            transitionDuration: Duration(milliseconds: 300), // Animation duration
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return Obx(()=>Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.warning_amber_rounded, color: Colors.red, size: 40),
                                      SizedBox(height: 20),
                                      Text(
                                        "Delete Account",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Are you sure you want to delete your account? This action cannot be undone.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Montserrat',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Close dialog
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.grey[300],
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                          ),
                                          isSubmit.value == true ?
                                          Container(
                                            height: 64.h(context),
                                            width: 64.h(context),
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent
                                            ),
                                            child: const Center(
                                              child: CircularProgressIndicator(color: ColorUtils.green176,),
                                            ),
                                          ) :
                                          ElevatedButton(
                                            onPressed: () async {
                                              isSubmit.value = true;
                                              await UserProfileEditController.deleteAccountResponse(
                                                userId: userProfileResponseModel.value.data?.sId ?? "",
                                                onSuccess: (e) async {
                                                  CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
                                                  await AppLocalStorage.removeKey(key: "Login");
                                                  Get.off(()=>SignInScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            },
                            transitionBuilder: (context, animation, secondaryAnimation, child) {
                              final curvedValue = Curves.easeInOut.transform(animation.value) - 1;
                              return Transform.translate(
                                offset: Offset(0, curvedValue * -50),
                                child: Opacity(
                                  opacity: animation.value,
                                  child: child,
                                ),
                              );
                            },
                          );
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.delete_forever_sharp, color: Colors.black,size: 30.r(context),),

                                  CustomSpaceWidget.spacerWidget(spaceWidth: 15.w(context)),

                                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                    plainTextString: "Delete Account",
                                    plainTextStringFontSize: 16.sp(context),
                                    plainTextStringFontWeight: FontWeight.w500,
                                    plainTextContainerAlignment: Alignment.centerLeft,
                                    plainTextStringTextAlign: TextAlign.start,
                                    plainTextStringColor: Color(0xff727272),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            )


          ],
        ),
      ),
    ));
  }

}