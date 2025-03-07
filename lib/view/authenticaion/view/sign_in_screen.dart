// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/view/authenticaion/controller/auth_controller.dart';
import 'package:discount_me_app/view/authenticaion/controller/password_controller.dart';
import 'package:discount_me_app/view/authenticaion/view/forgot_pasword_screen.dart';
import 'package:discount_me_app/view/users/home_view/view/user_home_screen.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/gestures.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        Get.off(()=>const WelcomeScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: SignInScreenWidget().signInScreenWidget(context: context),
      ),
    );
  }
}

