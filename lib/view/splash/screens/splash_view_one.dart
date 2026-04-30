import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:get/get.dart';


class SplashViewOne extends StatelessWidget {
  SplashViewOne({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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

                  SpaceHelperWidget.v(177.5.h(context)),

                  ImageHelperWidget.assetImageWidget(
                    context: context,
                    height: 246.5.h(context),
                    width: 369.w(context),
                    imageString: ImageUtils.deliciousVitaminFood,
                  ),



                  SpaceHelperWidget.v(55.h(context)),


                  ImageHelperWidget.assetImageWidget(
                    context: context,
                    height: 93.h(context),
                    width: 339.w(context),
                    imageString: ImageUtils.discountMeLogo,
                  ),

                  SpaceHelperWidget.v(236.h(context)),


                  TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    textAlign: TextAlign.center,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    textColor: ColorUtils.white255,
                    text: "Discount Me come to help you hunger problem with easy find any restaurant ",
                  ),

                  SpaceHelperWidget.v(19.2.h(context)),


                  ButtonWidget(),


                  SpaceHelperWidget.v(20.h(context)),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


