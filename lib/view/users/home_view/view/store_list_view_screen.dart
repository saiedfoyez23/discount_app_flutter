import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreListViewScreen extends StatelessWidget {
  const StoreListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StoreListViewScreenWidget storeListViewScreenWidget = Get.put(StoreListViewScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>UserDashboardView(index: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: storeListViewScreenWidget.storeListViewScreenWidget(context: context),
      ),
    );
  }
}
