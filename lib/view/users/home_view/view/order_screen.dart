import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/view/users/home_view/widget/order_screen_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderScreenWidget orderScreenWidget = Get.put(OrderScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>UserDashboardView(index: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: orderScreenWidget.orderScreenWidget(),
      ),
    );
  }
}
