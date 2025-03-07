import 'package:flutter/material.dart';

import '../res.dart';

class CustomAppBarContainer {


  Widget authScreenAppBar({
    required BuildContext context,
    required String title,
    required Function() onPress
  }) {
    return SliverAppBar(
      pinned: false,
      primary: true,
      floating: true,
      backgroundColor: Colors.transparent,
      collapsedHeight: 115.h(context),
      expandedHeight: 115.h(context),
      flexibleSpace: Container(
        height: 115.h(context),
        width: 428.w(context),
        decoration: const BoxDecoration(
            color: Colors.transparent
        ),
        child: Column(
          children: [

            CustomSpaceWidget.spacerWidget(spaceHeight: 50.h(context)),


            Row(
              children: [

                IconButton(
                  onPressed: onPress,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 24,
                  color: AppColors.white255,
                ),


                CustomSpaceWidget.spacerWidget(spaceHeight: 5.w(context)),

                Expanded(
                  child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "${title}",
                    plainTextStringFontSize: 27.sp(context),
                    plainTextStringFontWeight: FontWeight.w700,
                    plainTextContainerAlignment: Alignment.center,
                    plainTextStringColor: AppColors.white253,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }



}