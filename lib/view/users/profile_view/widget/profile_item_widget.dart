// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

class ProfileItemWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final Icon? navigateIcon;
  final VoidCallback? onTap;
  final Widget? widget;
  ProfileItemWidget({super.key, required this.title, required this.icon, this.navigateIcon, this.onTap, this.widget});

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
          widget??Container(
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            height: 0.5,
            color: Colors.grey,
          ),
          15.heightBox,
        ],
      ),
    );
  }
}
