// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/chat_view/view/user_chat_vendor_list_screen.dart';
import 'package:discount_me_app/view/users/profile_view/controller/nameController.dart';
import 'package:discount_me_app/view/users/profile_view/widget/profile_item_widget.dart';
import 'package:discount_me_app/view/users/user_profile_order_view/view/user_profile_order_status_screen.dart';

class UserProfileHomeScreen extends StatelessWidget {
  UserProfileHomeScreen({super.key});
  final NameController nameController = Get.put(NameController());

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // appBar
                  10.heightBox,
                  UserProfileAppbarWidget(title: " Profile", widget: SizedBox(),),

                  // Profile image
                  20.heightBox,
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            AppImages.profileImage,
                            fit: BoxFit.cover,
                            width: 202.w,
                            height: 202.h,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 17,
                          child: GestureDetector(
                            onTap: () {
                              PickerDialog().showImagePickerDialog(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 34.w,
                              height: 34.h,
                              decoration: BoxDecoration(
                                color: AppColors.secondaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // name section
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => CustomText(title: nameController.name.value,  fontSize: 18.sp, fontWeight: FontWeight.w700, color: AppColors.blackColor,)),
                      10.widthBox,
                      GestureDetector(
                        onTap: () => PickerDialog().showNameChangeDialog(context),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle
                          ),
                          child: Icon(Icons.edit, color: Colors.white, size: 18.sp,),
                        ),
                      )
                    ],
                  ),

                  // profile item
                  20.heightBox,
                  ProfileItemWidget(title: "Edit Profile",
                    icon: Image.asset(AppImages.userEdite, scale: 4,),
                    navigateIcon: Icon(Icons.navigate_next, size: 24, color: Colors.black54,),
                    onTap: () {
                    Get.to(UserProfileEditScreen());
                      },
                    ),

                  ProfileItemWidget(title: "Card",
                    icon: Image.asset(AppImages.shoppingCardIcon, scale: 4,),
                    navigateIcon: Icon(Icons.navigate_next,size: 24, color: Colors.black54,),
                    onTap: () {
                      Get.to(OrderScreen());
                    },
                  ),

                  ProfileItemWidget(title: "Order",
                    icon: Image.asset(AppImages.userOrder, scale: 4,),
                    navigateIcon: Icon(Icons.navigate_next,size: 24, color: Colors.black54,),
                    onTap: () {
                      Get.to(UserProfileOrderStatusScreen());
                    },
                  ),
                  ProfileItemWidget(title: "Support Chat",
                    icon: Image.asset(AppImages.chat, scale: 4,),
                    navigateIcon: Icon(Icons.navigate_next,size: 24, color: Colors.black54,),
                    onTap: () {
                      Get.to(UserChatVendorListScreen());
                    },
                  ),
                  ProfileItemWidget(title: "Notification",
                    icon: Image.asset(AppImages.userNotification, scale: 4,),
                    navigateIcon: Icon(Icons.navigate_next,size: 24, color: Colors.black54,),
                    onTap: () {
                      Get.to(UserNotificationScreen());
                    },
                  ),
                  ProfileItemWidget(title: "Settings",
                    icon: Image.asset(AppImages.settingIcon, scale: 4,),
                    navigateIcon: Icon(Icons.navigate_next,size: 24, color: Colors.black54,),
                    onTap: () {
                      Get.to(UserProfileSettingScreen());
                    },
                  ),
                  ProfileItemWidget(title: "Logout",
                    icon: Image.asset(AppImages.logout, scale: 4,),
                    onTap: () {
                      CustomAlertDialog().customAlert(
                        context: context, title: 'Logout',
                        message: 'Are you sure you want to logout?',
                        NegativebuttonText: 'Cancel',
                        PositivvebuttonText: 'Logout',
                        onPositiveButtonPressed: () {
                          Navigator.of(context).pop();
                          Get.to(()=>SignInScreen());
                        },
                        onNegativeButtonPressed: () => Navigator.of(context).pop(),
                      );
                    },
                    widget: SizedBox(),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
