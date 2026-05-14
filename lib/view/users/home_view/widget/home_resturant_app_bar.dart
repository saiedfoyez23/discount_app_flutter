import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';

class HomeResturantAppBar extends StatelessWidget {
  const HomeResturantAppBar({super.key});

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

        Row(
          children: [

            GestureDetector(
              onTap: () {
                Get.to(UserNotificationView());
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorUtils.primaryColor,
                    boxShadow: const [
                      BoxShadow(color: ColorUtils.whiteColor,
                          blurRadius: 10, offset: Offset(0, 1))
                    ]
                ),
                child: Icon(Icons.notifications, color: ColorUtils.whiteColor, size: 20.sp(context),),
              ),
            ),

            6.widthBox,
            GestureDetector(
              onTap: () {
                Get.to(CartView());
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorUtils.primaryColor,
                    boxShadow: const [
                      BoxShadow(color: ColorUtils.whiteColor,
                          blurRadius: 10, offset: Offset(0, 2))
                    ]
                ),
                child: Icon(Icons.shopping_cart, color: ColorUtils.whiteColor,size: 18.sp(context),),
              ),
            ),

          ],
        )
      ],
    );
  }
}
