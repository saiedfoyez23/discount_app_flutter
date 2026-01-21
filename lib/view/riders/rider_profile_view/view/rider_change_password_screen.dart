import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderChangePasswordScreen extends StatelessWidget {
  RiderChangePasswordScreen({super.key});
  
  
  RiderChangePasswordScreenWidget riderChangePasswordScreenWidget = Get.put(RiderChangePasswordScreenWidget());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: riderChangePasswordScreenWidget.riderChangePasswordScreenWidget(context: context),
    );
  }
}
