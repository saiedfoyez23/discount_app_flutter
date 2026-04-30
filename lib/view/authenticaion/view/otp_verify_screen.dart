import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key,required this.email,required this.isSignUp});

  final String email;
  final bool isSignUp;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if(isSignUp == true) {
          Get.off(()=>SignUpView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        } else {
          Get.off(()=>const ForgotPasswordScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        }
      },
      child: Scaffold(
        body: OtpVerifyScreenWidget().otpVerifyScreenWidget(context: context,email: email,isSignUp: isSignUp),
      ),
    );
  }
}
