import 'package:discount_me_app/res/app_const/import_list.dart' show Container;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonContainer {


  static Widget plainButtonContainer({
    required double plainButtonHeight,
    required double plainButtonWidth,
    required double plainButtonRadius,
    Color plainButtonBorderColor = Colors.transparent,
    double plainButtonBorderWidth = 0.0,
    Color plainButtonColor = Colors.transparent,
    required Function() plainButtonOnPress,
    required String plainButtonHint,
    TextAlign plainButtonHintTextAlign = TextAlign.center,
    Alignment plainButtonHintAlign = Alignment.center,
    required double plainButtonHintFontSize,
    FontStyle plainButtonHintFontStyle = FontStyle.normal,
    Color plainButtonHintFontColor = Colors.white,
    FontWeight plainButtonHintFontWeight = FontWeight.w700
  }) {
    return Container(
      height: plainButtonHeight,
      width: plainButtonWidth,
      decoration: plainButtonBorderWidth == 0.0 ?
      BoxDecoration(
        borderRadius: BorderRadius.circular(plainButtonRadius),
        color: plainButtonColor,
      ) : BoxDecoration(
        border: Border.all(color: plainButtonBorderColor,width: plainButtonBorderWidth),
        borderRadius: BorderRadius.circular(plainButtonRadius),
        color: plainButtonColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: plainButtonOnPress,
        child: Align(
          alignment: plainButtonHintAlign,
          child: Text(
            plainButtonHint,
            textAlign: plainButtonHintTextAlign,
            style: GoogleFonts.urbanist(
              fontSize: plainButtonHintFontSize,
              fontStyle: plainButtonHintFontStyle,
              color: plainButtonHintFontColor,
              fontWeight: plainButtonHintFontWeight,
            ),
          ),
        ),
      ),
    );
  }


}