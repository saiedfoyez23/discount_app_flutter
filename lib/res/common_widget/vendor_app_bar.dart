import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
class VendorAppBar extends StatelessWidget {
  const VendorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightBlueAccent,
                ),
                child: Image.asset(
                  ImageUtils.homeProfileAvatar,
                  scale: 4,
                  fit: BoxFit.cover,
                ),
              ),

              // Centering the logo using Expanded and Align
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageUtils.discountMeLogo,
                    scale: 10,
                  ),
                ),
              ),
            ],
          ),
        ),

        /*Row(
          children: [

            GestureDetector(
              onTap: () {
                Get.to(UserNotificationScreen());
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
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
               * Get.to(OrderScreen());
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
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
        )*/
      ],
    );
  }
}
