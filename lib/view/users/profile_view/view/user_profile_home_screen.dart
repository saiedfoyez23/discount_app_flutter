import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileHomeScreen extends StatelessWidget {
  UserProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileHomeScreenWidget userProfileHomeScreenWidget = Get.put(UserProfileHomeScreenWidget(context: context));
    return Scaffold(
      body: userProfileHomeScreenWidget.userProfileHomeScreenWidget(context: context),
    );
  }
}
