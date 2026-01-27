import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';

class UserProfileAppbarWidget extends StatelessWidget {
  final String title;
  final Widget? widget;
  final VoidCallback? onTap;
  UserProfileAppbarWidget({super.key, required this.title, this.onTap, this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 28.h(context),
          width: 28.h(context),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: widget ?? TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: onTap,
            child: Icon(Icons.arrow_back, color: Colors.black, size: 28.r(context),),
          ),
        ),

        Expanded(
          child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
            plainTextString: "${title}",
            plainTextStringFontSize: 28.sp(context),
            plainTextStringFontWeight: FontWeight.w700,
            plainTextContainerAlignment: Alignment.center,
            plainTextStringTextAlign: TextAlign.center,
            plainTextStringColor: ColorUtils.black29,
          ),
        ),

      ],
    );
  }
}
