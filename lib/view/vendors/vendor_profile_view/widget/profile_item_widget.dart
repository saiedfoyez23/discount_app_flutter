// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

class CustomProfileItemWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final Icon? navigateIcon;
  final VoidCallback? onTap;
  CustomProfileItemWidget({super.key, required this.title, required this.icon, this.navigateIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    20.widthBox,
                    CustomText(
                        title: title,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor
                    ),
                  ],
                ),
                Container(child: navigateIcon,)
              ],
            ),
          ),
          10.heightBox,
        ],
      ),
    );
  }
}
