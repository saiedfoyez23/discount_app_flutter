import 'package:discount_me_app/view/vendors/vendor_profile_view/view/vendor_profile_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/view.dart';

class DashboardVendorController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  double width;
  DashboardVendorController({required this.index,required this.width});
  RxDouble notchX = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 10),() async {
      await changeIndex(index: index,width: width);
    });
  }


  Future<void> changeIndex({required int index,required double width}) async {
    selectedIndex.value = index;
    notchX.value = getNotchPosition(width: width,index: index);
  }


  double getNotchPosition({required double width,required int index}) {
    final itemWidth = width / pages.length;
    return (itemWidth * index) + itemWidth / 2;
  }

  RxList<Map<String, dynamic>> items = [
    {'unselected': ImageUtils.vendorUnselectedHomeImage, 'select': ImageUtils.vendorSelectedHomeImage, 'label': 'Home'},
    {'unselected': ImageUtils.vendorUnselectedSubscriptionImage, 'select': ImageUtils.vendorSelectedSubscriptionImage, 'label': 'Subscription'},
    {'unselected': ImageUtils.vendorUnselectedItemsImage, 'select': ImageUtils.vendorSelectedItemsImage, 'label': 'Items'},
    {'unselected': ImageUtils.vendorUnselectedProfileImage, 'select': ImageUtils.vendorSelectedProfileImage, 'label': 'Profile'},
  ].obs;

  RxList<Widget> pages = [
    VendorHomeScreen(),
    VendorSubscriptionView(),
    VendorItemView(),
    VendorProfileHomeView(),
  ].obs;





}