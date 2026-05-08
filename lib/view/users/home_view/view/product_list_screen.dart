import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key,required this.categoryId,required this.storeId});
  final String categoryId;
  final String storeId;
  @override
  Widget build(BuildContext context) {
    ProductListScreenWidget productListScreenWidget = Get.put(ProductListScreenWidget(context: context,categoryId: categoryId,storeId: storeId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>UserDashboardView(index: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: productListScreenWidget.productListScreenWidget(context: context),
      ),
    );
  }
}
