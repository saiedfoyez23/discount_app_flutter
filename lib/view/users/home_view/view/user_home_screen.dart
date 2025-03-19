
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserHomeScreenWidget userHomeScreenWidget = Get.put(UserHomeScreenWidget(context: context));
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: userHomeScreenWidget.userHomeScreenWidget(context: context),
    );
  }
}

