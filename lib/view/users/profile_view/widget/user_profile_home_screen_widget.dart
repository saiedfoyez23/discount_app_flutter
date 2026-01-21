import 'dart:io';

import 'package:discount_me_app/res/common_widget/custom_alert_dialog.dart';
import 'package:discount_me_app/view/users/chat_view/view/user_chat_vendor_list_screen.dart';
import 'package:discount_me_app/view/users/home_view/view/order_screen.dart';
import 'package:discount_me_app/view/users/profile_view/view/user_notification_screen.dart';
import 'package:discount_me_app/view/users/profile_view/view/user_profile_edit_screen.dart';
import 'package:discount_me_app/view/users/profile_view/view/user_profile_setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:discount_me_app/utils/utils.dart';
import '../../../../res/res.dart';
import '../../../view.dart';
import '../../user_profile_order_view/view/user_profile_order_status_screen.dart';

class UserProfileHomeScreenWidget extends GetxController {


  RxBool isLoading = false.obs;

  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  BuildContext context;
  Rx<TextEditingController> nameControllerText = TextEditingController().obs;
  UserProfileHomeScreenWidget({required this.context});




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
            nameControllerText.value.text = userProfileResponseModel.value.data?.name ?? "N/A";
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

  Widget userProfileHomeScreenWidget({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(ImageUtils.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5),
      ),
      child: Obx(()=>Skeletonizer(
        effect: PulseEffect(),
        enabled: isLoading.value,
        child: RefreshIndicator(
          onRefresh: () async {
            Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
          },
          child: CustomScrollView(
            slivers: [


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // appBar
                      CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                      UserProfileAppbarWidget(title: " Profile", widget: SizedBox(),),

                      // Profile image

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                      Center(
                        child: Stack(
                          children: [
                            userProfileResponseModel.value.data?.image != null ?
                            CustomImageContainer.networkImageContainer(
                              height: 220.h(context),
                              width: 220.w(context),
                              networkImage: userProfileResponseModel.value.data?.image,
                              boxFit: BoxFit.fitWidth,
                              boxShape: BoxShape.circle,
                            ) :
                            CustomImageContainer.assetImageContainer(
                              height: 220.h(context),
                              width: 220.w(context),
                              assetImage: ImageUtils.profileImage,
                              boxFit: BoxFit.fitWidth,
                              boxShape: BoxShape.circle,
                            ),
                            Positioned(
                              bottom: 24.h(context),
                              right: 17.w(context),
                              child: Container(
                                alignment: Alignment.center,
                                width: 34.w(context),
                                height: 34.h(context),
                                decoration: BoxDecoration(
                                  color: ColorUtils.secondaryColor,
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
                                                    await UserProfileEditController.getUserImageUpdateResponse(
                                                        image: File(pickedFile.path),
                                                        name: userProfileResponseModel.value.data?.name ?? "",
                                                        onSuccess: (e) {
                                                          Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
                                                    await UserProfileEditController.getUserImageUpdateResponse(
                                                        name: userProfileResponseModel.value.data?.name ?? "",
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
                                    color: ColorUtils.whiteColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // name section

                      CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),

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
                            plainTextStringColor: ColorUtils.black29,
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
                                        await UserProfileEditController.getUserNameUpdateResponse(
                                            name: nameControllerText.value.text,
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

                      ProfileItemWidget(
                        title: "Edit Profile",
                        icon: Image.asset(ImageUtils.userEdite, scale: 5,),
                        navigateIcon: Icon(Icons.navigate_next, size: 24.r(context), color: Colors.black54,),
                        onTap: () {
                          Get.off(()=>UserProfileEditScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                        },
                      ),

                      ProfileItemWidget(
                        title: "Card",
                        icon: Image.asset(ImageUtils.shoppingCardIcon, scale: 5,),
                        navigateIcon: Icon(Icons.navigate_next,size: 24.r(context), color: Colors.black54,),
                        onTap: () {
                          Get.to(OrderScreen());
                        },
                      ),

                      ProfileItemWidget(
                        title: "Order",
                        icon: Image.asset(ImageUtils.userOrder, scale: 5,),
                        navigateIcon: Icon(Icons.navigate_next,size: 24.r(context), color: Colors.black54,),
                        onTap: () {
                          Get.to(UserProfileOrderStatusScreen());
                        },
                      ),
                      ProfileItemWidget(
                        title: "Support Chat",
                        icon: Image.asset(ImageUtils.chat, scale: 5,),
                        navigateIcon: Icon(Icons.navigate_next,size: 24.r(context), color: Colors.black54,),
                        onTap: () {
                          Get.to(UserChatVendorListScreen());
                        },
                      ),
                      ProfileItemWidget(
                        title: "Notification",
                        icon: Image.asset(ImageUtils.userNotification, scale: 5,),
                        navigateIcon: Icon(Icons.navigate_next,size: 24.r(context), color: Colors.black54,),
                        onTap: () {
                          Get.to(UserNotificationScreen());
                        },
                      ),
                      ProfileItemWidget(
                        title: "Settings",
                        icon: Image.asset(ImageUtils.settingIcon, scale: 5,),
                        navigateIcon: Icon(Icons.navigate_next,size: 24.r(context), color: Colors.black54,),
                        onTap: () {
                          Get.off(()=>UserProfileSettingScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                        },
                      ),
                      ProfileItemWidget(title: "Logout",
                        icon: Image.asset(ImageUtils.logout, scale: 5,),
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
                        widget: SizedBox(),
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