import 'package:discount_me_app/view/splash/screens/splash_view_two.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ButtonController extends GetxController  with GetSingleTickerProviderStateMixin {

  late AnimationController rotationController;
  final isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isAnimating.value = false;
        Get.offAll(()=>SplashViewTwo(),duration: const Duration(milliseconds: 100));
      }
    });
  }

  void onButtonTap() {
    if (isAnimating.value) return;

    isAnimating.value = true;
    rotationController.forward(from: 0); // start animation
  }

  @override
  void onClose() {
    rotationController.dispose();
    super.onClose();
  }

}