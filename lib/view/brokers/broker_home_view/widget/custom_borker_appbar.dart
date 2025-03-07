// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:flutter/material.dart';

class CustomBrokerAppBar extends StatelessWidget {
  const CustomBrokerAppBar({super.key});

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
                  AppImages.homeProfileAvatar,
                  scale: 4,
                  fit: BoxFit.cover,
                ),
              ),

              20.widthBox,
              // Centering the logo using Expanded and Align
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.discountMeLogo,
                    scale: 10,
                  ),
                ),
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: () {},
          child: Icon(Icons.notifications_outlined, color: Colors.black, size: 32),
        ),
      ],
    );
  }
}
