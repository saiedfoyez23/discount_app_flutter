import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          Get.off(()=>const WelcomeScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        },
        child: SignUpScreenWidget().signUpScreenWidget(context: context),
      ),
    );
  }
}
