import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          overlayColor: Colors.transparent
        ),
        onPressed: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,

                    SpaceHelperWidget.h(20.w(context)),


                    TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      text: title,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                      alignment: Alignment.centerLeft,
                      textColor: ColorUtils.black29,
                      fontSize: 18
                    ),

                  ],
                ),

                Container(child: navigateIcon,)
              ],
            ),


            SpaceHelperWidget.v(10.h(context)),


            title == "Logout" ?
            SizedBox.shrink() :
            Column(
              children: [

                widget ?? Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.hpm(context)),
                  height: 0.5,
                  color: Colors.grey,
                ),


                SpaceHelperWidget.v(10.h(context)),


              ],
            )

          ],
        ),
      ),
    );
  }
}
