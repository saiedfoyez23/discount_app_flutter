// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [

              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    color: Colors.lightBlueAccent
                ),
                child: Image.asset(AppImages.homeProfileAvatar, scale: 4, fit:BoxFit.cover,),
              ),

              20.widthBox,
              const Icon(Icons.location_on, size: 16,),
              5.widthBox,
              CustomText(
                title: "Block B Phase 2 Johar Town",
                color: AppColors.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              )
            ],
          ),
        ),

        Row(
          children: [

            GestureDetector(
              onTap: () {
                Get.to(UserNotificationScreen());
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                    boxShadow: const [
                      BoxShadow(color: AppColors.whiteColor,
                          blurRadius: 10, offset: Offset(0, 1))
                    ]
                ),
                child: Icon(Icons.notifications, color: AppColors.whiteColor, size: 20.sp,),
              ),
            ),

            6.widthBox,
            GestureDetector(
              onTap: () {
                Get.to(OrderScreen());
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                    boxShadow: const [
                      BoxShadow(color: AppColors.whiteColor,
                          blurRadius: 10, offset: Offset(0, 2))
                    ]
                ),
                child: Icon(Icons.shopping_cart, color: AppColors.whiteColor,size: 18.sp,),
              ),
            ),

          ],
        )
      ],
    );
  }
}
