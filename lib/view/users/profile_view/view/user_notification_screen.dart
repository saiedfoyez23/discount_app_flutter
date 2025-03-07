// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_appbar_widget.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class UserNotificationScreen extends StatelessWidget {
  const UserNotificationScreen({super.key});

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
                  10.heightBox,
                  UserProfileAppbarWidget(
                      title: "Notification",
                      onTap: () => Get.back()
                  ),

                  40.heightBox,
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: _notificationWidget(),
                      ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _notificationWidget(){
    return Row(
      children: [

        Row(
          children: [
            Container(
              width: 16.w, height: 16.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black
              ),
            ),
            10.widthBox,
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: AppColors.greenLight
              ),
              child: Image.asset(AppImages.userNotification, scale: 4,),
            )
          ],
        ),
        20.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(title: "Welcome to Discount Me", color: AppColors.blackColor, fontWeight: FontWeight.w400, fontSize: 23.sp,),
            CustomText(title: "1 day ago", color: AppColors.whiteDarkActive, fontWeight: FontWeight.w400, fontSize: 16.sp,)
          ],
        )
      ],
    );
  }

}
