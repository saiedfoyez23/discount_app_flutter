import 'package:discount_me_app/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';

class SplashScreenViewTwoWidget {


  Widget splashScreenViewTwoWidget({required BuildContext context}) {
    return Container(
      height: 926.h(context),
      width: 428.w(context),
      decoration: const BoxDecoration(
        color: AppColors.white253,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 21.hpm(context),
      ),
      child: CustomScrollView(
        physics: MediaQuery.of(context).orientation.name == "portrait" ?
        const NeverScrollableScrollPhysics() :
        const AlwaysScrollableScrollPhysics(),
        slivers: [


          SliverToBoxAdapter(
            child: Column(
              children: [

                CustomSpaceWidget.spacerWidget(spaceHeight: 125.h(context)),


                CustomImageContainer.assetImageContainer(
                  height: 93.h(context),
                  width: 428.w(context),
                  assetImage: AppImages.discountMeLogo,
                  boxFit: BoxFit.contain,
                ),

                CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),

                CustomImageContainer.assetImageContainer(
                  height: 428.h(context),
                  width: 428.w(context),
                  assetImage: AppImages.eatingDonutBro,
                  boxFit: BoxFit.contain,
                ),

                CustomSpaceWidget.spacerWidget(spaceHeight: 142.h(context)),


                CustomButtonContainer.plainButtonContainer(
                  plainButtonHeight: 64.h(context),
                  plainButtonWidth: 428.w(context),
                  plainButtonRadius: 4.r(context),
                  plainButtonOnPress:  () async {
                    await AppLocalStorage.setBool(key: "getStart", value: true);
                    Get.off(()=> WelcomeScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                  },
                  plainButtonHint: "Let's Go",
                  plainButtonHintFontSize: 22.sp(context),
                  plainButtonColor: AppColors.orange41,
                  plainButtonHintFontColor: AppColors.white255,
                ),


                CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


              ],
            ),
          )








        ],
      ),
    );
  }

}