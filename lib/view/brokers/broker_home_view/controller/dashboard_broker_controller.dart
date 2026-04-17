import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/view/brokers/broker_referral_view/view/broker_referral_home_screen.dart';
import 'package:discount_me_app/view/brokers/broker_subscription_view/view/broker_subscription_home_screen.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBrokerController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  double width;
  DashboardBrokerController({required this.index,required this.width});
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
    {'unselected': ImageUtils.unselectedHome, 'select': ImageUtils.selectedHome, 'label': 'Home'},
    {'unselected': ImageUtils.unselectedSubscription, 'select': ImageUtils.selectedSubscription, 'label': 'Subscription'},
    {'unselected': ImageUtils.unselectedReferral, 'select': ImageUtils.selectedReferral, 'label': 'Referral'},
    {'unselected': ImageUtils.unselectedProfile, 'select': ImageUtils.selectedProfile, 'label': 'Profile'},
  ].obs;

  RxList<Widget> pages = [
    BrokerHomeView(),
    BrokerSubscriptionHomeScreen(),
    BrokerReferralHomeScreen(),
    BrokerProfileHomeView(),
  ].obs;


}