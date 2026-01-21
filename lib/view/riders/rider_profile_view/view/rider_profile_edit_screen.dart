import 'package:discount_me_app/view/riders/rider_profile_view/widget/rider_profile_edit_screen_widget.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RiderProfileEditScreen extends StatelessWidget {
  RiderProfileEditScreen({super.key});


  @override
  Widget build(BuildContext context) {
    RiderProfileEditScreenWidget riderProfileEditScreenWidget = Get.put(RiderProfileEditScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: riderProfileEditScreenWidget.riderProfileEditScreenWidget(context: context),
      ),
    );
  }

}
