

import 'package:discount_me_app/res/res.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDottedWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final Color dottedColor;
  final Color buttonColor;
  final Color textColor;
  CustomDottedWidget({
    super.key,
    this.onPress,
    this.dottedColor=Colors.black,
    this.buttonColor=Colors.black,
    this.textColor=Colors.black
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        DottedBorder(
          color: dottedColor,
          // Dotted border color
          strokeWidth: 1,
          dashPattern: const [6, 3],
          // Length of dashes and gaps
          borderType: BorderType.RRect,
          // Rounded rectangular border
          radius: Radius.circular(6.r(context)),
          // Border radius
          child: Container(
            width: 428.w(context),
            height: 150.h(context),
            decoration: const BoxDecoration(
              color: Colors.transparent, // Background color inside dotted border
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            width: 428.w(context),
            height: 150.h(context),
            decoration: const BoxDecoration(
              color: Colors.transparent, // Background color inside dotted border
            ),
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: onPress,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 32.r(context),
                    color: buttonColor,
                  ),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),


                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: "Upload",
                    plainTextStringFontSize: 24.sp(context),
                    plainTextStringFontWeight: FontWeight.w600,
                    plainTextContainerAlignment: Alignment.center,
                    plainTextStringColor: textColor,
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
