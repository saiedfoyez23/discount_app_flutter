import 'package:discount_me_app/res/res.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDottedWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final Color dottedColor;
  final Color buttonColor;
  final Color textColor;
  final String lable;
  CustomDottedWidget({
    super.key,
    this.onPress,
    this.dottedColor = Colors.black,
    this.buttonColor = Colors.black,
    this.textColor = Colors.black,
    this.lable = "",
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            color: dottedColor,
            strokeWidth: 1,
            dashPattern: const [6, 3],
            radius: Radius.circular(6.r(context)),
          ),
          // Border radius
          child: Container(
            width: 428.w(context),
            height: 150.h(context),
            decoration: const BoxDecoration(
              color:
                  Colors.transparent, // Background color inside dotted border
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            width: 428.w(context),
            height: 200.h(context),
            decoration: const BoxDecoration(
              color:
                  Colors.transparent, // Background color inside dotted border
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.hpm(context)),
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: onPress,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 32.r(context), color: buttonColor),

                  CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),

                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                    plainTextString: lable == "" ? "Upload" : lable,
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
