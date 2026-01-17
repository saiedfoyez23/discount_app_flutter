import 'dart:math' as math;
import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key});

  final ButtonController buttonController = Get.put(ButtonController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonController.onButtonTap();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Rotating outer stroke
          AnimatedBuilder(
            animation: buttonController.rotationController,
            builder: (_, child) {
              return Transform.rotate(
                angle: buttonController.rotationController.value * 2 * math.pi,
                child: child,
              );
            },
            child: CustomPaint(
              size: Size(70.w(context), 78.h(context)),
              painter: ButtonStrokePainter(),
            ),
          ),


          Container(
            height: 69.94.h(context),
            width: 69.94.w(context),
            decoration: const BoxDecoration(
              color: AppColors.orange41,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: CustomImageContainer.assetImageContainer(
              height: 39.47.h(context),
              width: 39.47.w(context),
              assetImage: AppImages.splashScreenArrowImage,
              boxFit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
