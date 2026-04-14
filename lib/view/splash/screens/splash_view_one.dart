import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';

class SplashViewOne extends StatelessWidget {
  const SplashViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenViewOneWidget().splashScreenViewOneWidget(context: context),
    );
  }
}


