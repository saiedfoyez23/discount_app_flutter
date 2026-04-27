import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController with GetSingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation = Tween<double>(begin: -1, end: 1.5).animate(animationController);
    animationController.repeat(reverse: true);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}