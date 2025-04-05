

import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserChangePasswordScreen extends StatelessWidget {
  UserChangePasswordScreen({super.key});

  final UserChangePasswordScreenWidget userChangePasswordScreenWidget = Get.put(UserChangePasswordScreenWidget());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>UserProfileSettingScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: userChangePasswordScreenWidget.userChangePasswordScreenWidget(context: context),
      ),
    );
  }
}
