import 'dart:io';

import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_profile_edit_screen.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_setting_screen.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../res/common_widget/custom_alert_dialog.dart';
import '../../rider_earning_view/view/rider_profile_earing_home_screen.dart';

class RiderProfileHomeScreenWidget extends GetxController {


  RxBool isLoading = false.obs;

  Rx<RiderProfileResponse> riderProfileResponse = RiderProfileResponse().obs;
  BuildContext context;
  Rx<TextEditingController> nameControllerText = TextEditingController().obs;
  RiderProfileHomeScreenWidget({required this.context});




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await RiderProfileController.getRiderProfileApiService(
          onSuccess: (e) {
            isLoading.value = false;
            riderProfileResponse.value = RiderProfileResponse.fromJson(e);
            nameControllerText.value.text = riderProfileResponse.value.data?.name ?? "N/A";
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
          }
      );
    });
  }

  Widget riderProfileHomeScreenWidget({required BuildContext context}) {
    return Container(
      height: 926.h(context),
      width: 428.w(context),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Obx(()=>Skeletonizer(
        effect: PulseEffect(),
        enabled: isLoading.value,
        child: RefreshIndicator(
          onRefresh: () async {
            Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
          },
          child: CustomScrollView(
            slivers: [


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                  child: Column(
                    children: [

                      // appBar
                      CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                      UserProfileAppbarWidget(title: " Profile", widget: SizedBox(),),

                      // Profile image

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                      Center(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.r(context)),
                              child: riderProfileResponse.value.data?.image != null ?
                              Image.network(
                                riderProfileResponse.value.data!.image,
                                fit: BoxFit.fitWidth,
                                width: 202.w(context),
                                height: 202.h(context),
                              ) :
                              Image.asset(
                                AppImages.profileImage,
                                fit: BoxFit.fitHeight,
                                width: 202.w(context),
                                height: 202.h(context),
                              ),
                            ),
                            Positioned(
                              bottom: 10.h(context),
                              right: 17.w(context),
                              child: Container(
                                alignment: Alignment.center,
                                width: 34.w(context),
                                height: 34.h(context),
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r(context)),
                                    topRight: Radius.circular(10.r(context)),
                                    bottomRight: Radius.circular(10.r(context)),
                                  ),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () async {
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
                                                  final pickedFile = await ImagePicker().pickImage(
                                                      source: ImageSource.gallery);
                                                  if (pickedFile != null) {
                                                    // Handle the picked image (e.g., update profile)
                                                    print('Image selected: ${pickedFile.path}');
                                                    isLoading.value = true;
                                                    Get.back();
                                                    await RiderProfileEditController.getRiderImageUpdateResponse(
                                                      image: File(pickedFile.path),
                                                      riderId: riderProfileResponse.value.data?.sId ?? "",
                                                      name: riderProfileResponse.value.data?.name ?? "",
                                                      onSuccess: (e) {
                                                        Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
                                                  } else {
                                                    // Show a SnackBar if no image is selected before popping the dialog
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('No image selected'),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  }
                                                  Get.back(); // Now safely pop the dialog after showing the SnackBar
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
                                                    print('Image selected: ${pickedFile.path}');
                                                    isLoading.value = true;
                                                    Get.back();
                                                    await RiderProfileEditController.getRiderImageUpdateResponse(
                                                        riderId: riderProfileResponse.value.data?.sId ?? "",
                                                        name: riderProfileResponse.value.data?.name ?? "",
                                                        image: File(pickedFile.path),
                                                        onSuccess: (e) {
                                                          Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                                          CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
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
                                                        }
                                                    );
                                                  } else {
                                                    // Show a SnackBar if no image is selected before popping the dialog
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('No image selected'),
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  }
                                                  Get.back(); // Now safely pop the dialog after showing the SnackBar
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    size: 16.r(context),
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // name section

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                            plainTextString: nameControllerText.value.text,
                            plainTextStringFontSize: 18.sp(context),
                            plainTextStringFontWeight: FontWeight.w700,
                            plainTextContainerAlignment: Alignment.center,
                            plainTextStringTextAlign: TextAlign.center,
                            plainTextStringColor: AppColors.black29,
                          ),


                          TextButton(
                            onPressed: () {
                              Get.dialog(
                                Obx(()=>AlertDialog(
                                  title: Text('Change Name'),
                                  content: TextField(
                                    controller: nameControllerText.value,
                                    decoration: InputDecoration(
                                      hintText: "Enter your name",
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Get.back(); // Close the dialog
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        isLoading.value = true;
                                        Get.back();
                                        await RiderProfileEditController.getRiderNameUpdateResponse(
                                          name: nameControllerText.value.text,
                                          riderId: riderProfileResponse.value.data?.sId ?? "",
                                          onSuccess: (e) {
                                            Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                            CustomSnackBar().successCustomSnackBar(context: context, message: "${e}");
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
                                        );// Close the dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                )),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                              ),
                              child: Icon(Icons.edit, color: Colors.white, size: 18.r(context),),
                            ),
                          )
                        ],
                      ),

                      // profile item
                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                      // profile item
                      ProfileItemWidget(
                        title: "Edit Profile",
                        icon: Image.asset(
                          AppImages.userEdite,
                          scale: 4,
                        ),
                        navigateIcon: Icon(
                          Icons.navigate_next,
                          size: 24,
                          color: Colors.black54,
                        ),
                        onTap: () {
                          Get.off(()=>RiderProfileEditScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                        },
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),
                      ProfileItemWidget(
                        title: "Earnings",
                        icon: Image.asset(
                          AppImages.earnIcon,
                          scale: 4,
                        ),
                        navigateIcon: Icon(
                          Icons.navigate_next,
                          size: 24,
                          color: Colors.black54,
                        ),
                        onTap: () {
                          Get.to(RiderProfileEarningHomeScreen());
                        },
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),
                      ProfileItemWidget(
                        title: "Settings",
                        icon: Image.asset(
                          AppImages.settingIcon,
                          scale: 4,
                        ),
                        navigateIcon: Icon(
                          Icons.navigate_next,
                          size: 24,
                          color: Colors.black54,
                        ),
                        onTap: () {
                          Get.off(()=>RiderSettingScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                        },
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),
                      ProfileItemWidget(
                        widget: CustomSpaceWidget.spacerWidget(),
                        title: "Logout",
                        icon: Image.asset(
                          AppImages.logout,
                          scale: 4,
                        ),
                        onTap: () {
                          CustomAlertDialog().customAlert(
                            context: context, title: 'Logout',
                            message: 'Are you sure you want to logout?',
                            NegativebuttonText: 'Cancel',
                            PositivvebuttonText: 'Logout',
                            onPositiveButtonPressed: () async {
                              await AppLocalStorage.removeKey(key: "Login");
                              await Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                            },
                            onNegativeButtonPressed: () => Navigator.of(context).pop(),
                          );
                        },
                      ),


                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      )),
    );
  }


}