// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_alert_dialog.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/view/riders/rider_earning_view/view/rider_profile_earing_home_screen.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_profile_edit_screen.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_setting_screen.dart';
import 'package:discount_me_app/view/users/profile_view/controller/nameController.dart';
import 'package:discount_me_app/view/users/profile_view/widget/profile_item_widget.dart';

class RiderProfileHome extends StatelessWidget {
  RiderProfileHome({super.key});
  final NameController nameController = Get.put(NameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          title: "Profile",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            color: Color(0xff40C4FF),
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
                  Obx(() => CustomText(
                        title: nameController.name.value,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      )),
                  10.widthBox,
                  GestureDetector(
                    onTap: () {
                      PickerDialog().showNameChangeDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18.sp,
                      )
                    ),
                  )
                ],
              ),

              // profile item
              20.heightBox,
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
                  Get.to(RiderProfileEditScreen());
                },
              ),

              10.heightBox,
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

              10.heightBox,
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
                  Get.to(RiderSettingScreen());
                },
              ),
              10.heightBox,
              ProfileItemWidget(
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
                    onPositiveButtonPressed: () {
                      Navigator.of(context).pop();
                      Get.to(()=>SignInScreen());
                    },
                    onNegativeButtonPressed: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
