import 'package:discount_me_app/res/res.dart';
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
            AppColors.whiteColor,
            AppColors.green247,
            AppColors.green106,
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
                  assetImage: AppImages.deliciousVitaminFood,
                  boxFit: BoxFit.contain,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 26.h(context)),
            
            
                CustomImageContainer.assetImageContainer(
                  height: 93.h(context),
                  width: 428.w(context),
                  assetImage: AppImages.discountMeLogo,
                  boxFit: BoxFit.contain,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 16.h(context)),
                
                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  plainTextString: "No Worry, Handle Your Hunger with",
                  plainTextStringFontSize: 24.sp(context),
                  plainTextStringFontWeight: FontWeight.w400,
                  plainTextContainerAlignment: Alignment.center,
                  plainTextStringColor: AppColors.black114,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 5.h(context)),
            
                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  plainTextString: "Discount Me",
                  plainTextStringFontSize: 24.sp(context),
                  plainTextStringFontWeight: FontWeight.w700,
                  plainTextContainerAlignment: Alignment.center,
                  plainTextStringColor: AppColors.black114,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 162.h(context)),
            
            
                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                  plainTextString: "Discount Me come to help you hunger problem with easy find any restaurant ",
                  plainTextStringFontSize: 12.sp(context),
                  plainTextStringFontWeight: FontWeight.w700,
                  plainTextContainerAlignment: Alignment.center,
                  plainTextStringColor: AppColors.white255,
                ),
            
                CustomSpaceWidget.spacerWidget(spaceHeight: 19.2.h(context)),
            
            
                Container(
                  height: 64.h(context),
                  width: 64.w(context),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppImages.splashScreenRoundImage),
                      fit: BoxFit.contain,
                    )
                  ),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () async {
                      Get.off(()=> SplashViewTwo(),preventDuplicates: false,duration: const Duration(milliseconds: 100));
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Container(
                      height: 54.94.h(context),
                      width: 54.94.w(context),
                      decoration: const BoxDecoration(
                        color: AppColors.orange41,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: CustomImageContainer.assetImageContainer(
                          height: 30.47.h(context),
                          width: 30.47.w(context),
                          assetImage: AppImages.splashScreenArrowImage,
                          boxFit: BoxFit.contain
                      ),
                    ),
                  ),
                ),

                CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
            
            
              ],
            ),
          ),
        ],
      ),
    );
  }



}