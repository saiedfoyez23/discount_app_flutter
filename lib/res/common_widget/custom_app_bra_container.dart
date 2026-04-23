import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/res/res.dart';

class CustomAppBarContainer {


  Widget authScreenAppBar({
    required BuildContext context,
    required String title,
    required Function() onPress,
    bool pinned = false,
    bool primary = true,
    bool floating = true,
    bool automaticallyImplyLeading = false,
  }) {
    return SliverAppBar(
      pinned: pinned,
      primary: primary,
      floating: floating,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: Colors.transparent,
      collapsedHeight: 80.h(context),
      expandedHeight: 80.h(context),
      flexibleSpace: Container(
        height: 80.h(context),
        width: 428.w(context),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          children: [

            SpaceHelperWidget.v(10.h(context)),


            Row(
              children: [

                IconButton(
                  onPressed: onPress,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.r(context),
                  color: ColorUtils.white255,
                ),
                
                
                SpaceHelperWidget.h(5.w(context)),

                
                Expanded(
                  child: TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.center,
                    fontSize: 27,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                    textColor: ColorUtils.white253,
                    text: "${title}",
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