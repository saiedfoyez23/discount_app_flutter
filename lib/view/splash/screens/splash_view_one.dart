// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/view.dart';

class SplashViewOne extends StatelessWidget {
  const SplashViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenViewOneWidget().splashScreenViewOneWidget(context: context),
    );
  }
}


