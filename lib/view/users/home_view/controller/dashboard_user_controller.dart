import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/utils/utils.dart';

class DashboardUserController extends GetxController {

  RxInt selectedIndex = 0.obs;
  int index;
  double width;
  DashboardUserController({required this.index,required this.width});
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
    {'unselected': ImageUtils.unselectedHomeImage, 'select': ImageUtils.selectedHomeImage, 'label': 'Home'},
    {'unselected': ImageUtils.unselectedCouponImage, 'select': ImageUtils.selectedCouponImage, 'label': 'Points'},
    {'unselected': ImageUtils.unselectedExploreImage, 'select': ImageUtils.selectedExploreImage, 'label': 'Explore'},
    {'unselected': ImageUtils.unselectedUserImage, 'select': ImageUtils.selectedUserImage, 'label': 'Profile'},
  ].obs;

  RxList<Widget> pages = [
    UserHomeView(),
    PointsHomeView(),
    ExploreView(),
    ProfileView(),
  ].obs;




}