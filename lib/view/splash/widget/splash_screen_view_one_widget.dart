import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';


class SplashScreenViewOneWidget {

  SplashController splashController = Get.put(SplashController());


  Widget splashScreenViewOneWidget({required BuildContext context}) {
    return Container(
      height: 926.h(context),
      width: 428.w(context),
      padding: EdgeInsets.symmetric(
        horizontal: 21.hpm(context),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorUtils.whiteColor,
            ColorUtils.green247,
            ColorUtils.green106,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child: CustomScrollView(
        physics: MediaQuery.of(context).orientation.name == "portrait" ?
        const NeverScrollableScrollPhysics() :
        const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 133.h(context)),
                
                CustomImageContainer.assetImageContainer(
                  height: 246.5.h(context),
                  width: 428.w(context),
                  assetImage: ImageUtils.deliciousVitaminFood,
                  boxFit: BoxFit.contain,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 26.h(context)),
            
            
                CustomImageContainer.assetImageContainer(
                  height: 93.h(context),
                  width: 428.w(context),
                  assetImage: ImageUtils.discountMeLogo,
                  boxFit: BoxFit.contain,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 16.h(context)),
                
                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  plainTextString: "No Worry, Handle Your Hunger with",
                  plainTextStringFontSize: 24.sp(context),
                  plainTextStringFontWeight: FontWeight.w400,
                  plainTextContainerAlignment: Alignment.center,
                  plainTextStringColor: ColorUtils.black114,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 5.h(context)),
            
                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  plainTextString: "Discount Me",
                  plainTextStringFontSize: 24.sp(context),
                  plainTextStringFontWeight: FontWeight.w700,
                  plainTextContainerAlignment: Alignment.center,
                  plainTextStringColor: ColorUtils.black114,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 162.h(context)),
            
            
                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  plainTextString: "Discount Me come to help you hunger problem with easy find any restaurant ",
                  plainTextStringFontSize: 12.sp(context),
                  plainTextStringFontWeight: FontWeight.w700,
                  plainTextContainerAlignment: Alignment.center,
                  plainTextStringColor: ColorUtils.white255,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 19.2.h(context)),

                ButtonWidget(),

                CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
            
            
              ],
            ),
          ),
        ],
      ),
    );
  }



}