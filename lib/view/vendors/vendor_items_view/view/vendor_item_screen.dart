
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorItemScreen extends StatelessWidget {
  const VendorItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VendorItemScreenWidget vendorItemScreenWidget = Get.put(VendorItemScreenWidget(context: context));
    return Scaffold(
      body: vendorItemScreenWidget.vendorItemScreenWidget(context: context),
    );
  }
}


