import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view.dart';

class VendorItemDetailsViewScreen extends StatelessWidget {
  const VendorItemDetailsViewScreen({super.key,required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    VendorItemDetailsViewScreenWidget vendorItemDetailsViewScreenWidget = Get.put(VendorItemDetailsViewScreenWidget(context: context, productId: productId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>VendorHome(selectedIndex: 2,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: vendorItemDetailsViewScreenWidget.vendorItemDetailsViewScreenWidget(context: context),
      ),
    );
  }
}
