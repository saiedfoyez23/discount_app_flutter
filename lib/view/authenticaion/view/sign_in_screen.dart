import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';

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
        body: SafeArea(
          child: SignInScreenWidget().signInScreenWidget(context: context),
        ),
      ),
    );
  }
}

