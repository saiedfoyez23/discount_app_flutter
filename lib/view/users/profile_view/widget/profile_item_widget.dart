import 'package:flutter/material.dart';
import '../../../../res/res.dart';
import 'package:discount_me_app/utils/utils.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final Icon? navigateIcon;
  final VoidCallback? onTap;
  final Widget? widget;
  ProfileItemWidget({super.key, required this.title, required this.icon, this.navigateIcon, this.onTap, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,

                    CustomSpaceWidget.spacerWidget(spaceWidth: 20.w(context)),

                    CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                      plainTextString: title,
                      plainTextStringFontSize: 18.sp(context),
                      plainTextStringFontWeight: FontWeight.w400,
                      plainTextContainerAlignment: Alignment.centerLeft,
                      plainTextStringTextAlign: TextAlign.start,
                      plainTextStringColor: ColorUtils.black29,
                    ),

                  ],
                ),

                Container(child: navigateIcon,)
              ],
            ),

            CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),

            title == "Logout" ?
            SizedBox.shrink() :
            Column(
              children: [

                widget ?? Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.hpm(context)),
                  height: 0.5,
                  color: Colors.grey,
                ),


                CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),

              ],
            )

          ],
        ),
      ),
    );
  }
}
