import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key,required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        Get.off(()=> OtpVerifyScreen(email: email,isSignUp: false,),duration: const Duration(milliseconds: 100),preventDuplicates: false,);
      },
      child: Scaffold(
        body: CreatePasswordScreenWidget().createPasswordScreenWidget(context: context, email: email),
      ),
    );
  }
}
