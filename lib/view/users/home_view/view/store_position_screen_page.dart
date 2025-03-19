import 'package:discount_me_app/view/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StorePositionScreenPage extends StatelessWidget {
  const StorePositionScreenPage({super.key,required this.long,required this.lat,required this.storeId,required this.isStoreListPage,required this.isHomePage,});
  final double long;
  final double lat;
  final String storeId;
  final bool isHomePage;
  final bool isStoreListPage;
  @override
  Widget build(BuildContext context) {
    StorePositionScreenWidget storePositionScreenWidget = Get.put(StorePositionScreenWidget(long: long, lat: lat, context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>SingleStoreViewScreen(storeId: storeId,isStoreListPage: isStoreListPage,isHomePage: isHomePage,),preventDuplicates: false,duration: Duration(milliseconds: 100));
      },
      child: Scaffold(
        body: storePositionScreenWidget.storePositionScreenWidget(context: context),
      ),
    );
  }
}
