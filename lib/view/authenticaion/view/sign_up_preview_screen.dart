import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';

class SignUpPreviewScreen extends StatelessWidget {
  const SignUpPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 2), () {
    //   return Get.to(()=> SignInScreen());
    // },);
    return Scaffold(
      body: SignUpPreviewScreenWidget().signUpPreviewScreenWidget(context: context),
    );
  }
}
