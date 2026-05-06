import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
            image: AssetImage(ImageUtils.homeBg),
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
                        margin: EdgeInsets.only(bottom: 20.h(context)),
                        child: _notificationWidget(context: context),
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

  Widget _notificationWidget({required BuildContext context}) {
    return Row(
      children: [

        Row(
          children: [
            Container(
              width: 16.w(context), height: 16.h(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black
              ),
            ),
            10.widthBox,
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r(context)),
                  color: ColorUtils.greenLight
              ),
              child: Image.asset(ImageUtils.userNotification, scale: 4,),
            )
          ],
        ),
        20.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(title: "Welcome to Discount Me", color: ColorUtils.blackColor, fontWeight: FontWeight.w400, fontSize: 23.sp(context),),
            CustomText(title: "1 day ago", color: ColorUtils.whiteDarkActive, fontWeight: FontWeight.w400, fontSize: 16.sp(context),)
          ],
        )
      ],
    );
  }

}
