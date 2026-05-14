import 'package:discount_me_app/view/riders/home_view/view/rider_home_view.dart';
import 'package:discount_me_app/view/riders/rider_order_view/view/rider_order_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';

class DashboardRiderController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  double width;
  DashboardRiderController({required this.index,required this.width});
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
    {'unselected': ImageUtils.riderUnselectedHomeImage, 'select': ImageUtils.riderSelectedHomeImage, 'label': 'Home'},
    {'unselected': ImageUtils.riderUnselectedSubscriptionImage, 'select': ImageUtils.riderSelectedSubscriptionImage, 'label': 'Subscription'},
    {'unselected': ImageUtils.riderUnselectedOrderImage, 'select': ImageUtils.riderSelectedOrderImage, 'label': 'Orders'},
    {'unselected': ImageUtils.riderUnselectedProfileImage, 'select': ImageUtils.riderSelectedProfileImage, 'label': 'Profile'},
  ].obs;

  RxList<Widget> pages = [
    RiderHomeView(),
    RiderSubscriptionView(),
    RiderOrderHomeScreen(),
    RiderProfileHome(),
  ].obs;



}