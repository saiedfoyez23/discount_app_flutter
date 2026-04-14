import 'package:discount_me_app/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import '../../view.dart';


class SignUpPreviewScreenWidget {


  SignUpVerifyScreenController signUpPreviewScreenController = Get.put(SignUpVerifyScreenController());

  Widget signUpPreviewScreenWidget({required BuildContext context}) {
    return Container(
      height: 926.h(context),
      width: 428.w(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageUtils.authBg),
          fit: BoxFit.fill,
          opacity: 0.3,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.dstATop),
        ),
      ),
      child: CustomScrollView(
        slivers: [


          SliverToBoxAdapter(
            child: Container(
              width: 428.w(context),
              padding: EdgeInsets.symmetric(
                horizontal: 21.hpm(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  CustomSpaceWidget.spacerWidget(spaceHeight: 213.h(context)),


                  CustomImageContainer.assetImageContainer(
                    height: 376.h(context),
                    width: 376.w(context),
                    assetImage: ImageUtils.signUpPreviewImg,
                    boxFit: BoxFit.fitWidth,
                  ),


                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "Your application is under review",
                    plainTextStringFontSize: 22.sp(context),
                    plainTextStringFontWeight: FontWeight.w700,
                    plainTextContainerAlignment: Alignment.center,
                    plainTextStringColor: ColorUtils.orange125,
                    plainTextStringTextAlign: TextAlign.center,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),


                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "We will notify you as soon as your account has been approved",
                    plainTextStringFontSize: 18.sp(context),
                    plainTextStringFontWeight: FontWeight.w400,
                    plainTextContainerAlignment: Alignment.centerLeft,
                    plainTextStringColor: ColorUtils.white253,
                    plainTextStringTextAlign: TextAlign.center,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 30.h(context)),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }




}