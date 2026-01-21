import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderProfileHome extends StatelessWidget {
  const RiderProfileHome({super.key});


  @override
  Widget build(BuildContext context) {
    RiderProfileHomeScreenWidget riderProfileHomeScreenWidget = Get.put(RiderProfileHomeScreenWidget(context: context));
    return Scaffold(
      body: riderProfileHomeScreenWidget.riderProfileHomeScreenWidget(context: context),
    );
  }
}
