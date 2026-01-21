import 'package:flutter/material.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';

class SingleProductViewScreen extends StatelessWidget {
  const SingleProductViewScreen({
    super.key,
    required this.storeId,
    required this.productId,
    required this.isHomeScreen,
    required this.isSingleStoreScreen,
    required this.isProductListPage,
    required this.isExplorePage,
    required this.isStoreScreen,
  });
  final String productId;
  final String storeId;
  final bool isHomeScreen;
  final bool isSingleStoreScreen;
  final bool isProductListPage;
  final bool isExplorePage;
  final bool isStoreScreen;
  @override
  Widget build(BuildContext context) {
    SingleProductViewScreenWidget singleProductViewScreenWidget = Get.put(SingleProductViewScreenWidget(context: context, productId: productId));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        if(isHomeScreen == true) {
          Get.off(()=>UserHome(selectedIndex: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        } else if (isSingleStoreScreen == true) {
          Get.off(()=>SingleStoreViewScreen(storeId: storeId,isStoreListPage: isStoreScreen,isHomePage: isHomeScreen,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        } else if (isProductListPage == true) {
          Get.off(()=>ProductListScreen(categoryId: "",storeId: "",),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        }else if (isExplorePage == true) {
          Get.off(()=>UserHome(selectedIndex: 2,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        }
      },
      child: Scaffold(
        body: singleProductViewScreenWidget.singleProductViewScreenWidget(context: context),
      ),
    );
  }
}
