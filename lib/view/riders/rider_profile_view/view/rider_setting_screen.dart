import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderSettingScreen extends StatelessWidget {
  const RiderSettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    RiderSettingScreenWidget riderSettingScreenWidget = Get.put(RiderSettingScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: riderSettingScreenWidget.riderSettingScreenWidget(context: context),
      ),
    );
  }
}
