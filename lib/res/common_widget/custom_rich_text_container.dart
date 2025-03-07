import 'package:discount_me_app/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichTextContainer {


  static Widget plainRichTextContainerWidgetWithoutWidthHeight({
    required BuildContext context,
    Color plainRichTextContainerColor = Colors.transparent,
    Alignment plainRichTextContainerAlignment = Alignment.center,
    required TextAlign plainPrimaryTextStringAlign,
    required String plainPrimaryTextString,
    required double plainRichTextStringFontSize,
    Color plainRichTextStringColor = Colors.transparent,
    FontWeight plainRichTextStringFontWeight = FontWeight.normal,
    required List<TextSpan> textSpanList,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: plainRichTextContainerColor,
      ),
      alignment: plainRichTextContainerAlignment,
      child: RichText(
        textAlign: plainPrimaryTextStringAlign,
        text: TextSpan(
          text: plainPrimaryTextString,
          style: plainRichTextStringStyle(
            context: context,
            plainRichTextStringColor: plainRichTextStringColor,
            plainRichTextStringFontWeight: plainRichTextStringFontWeight,
            plainRichTextStringFontSize: plainRichTextStringFontSize,
          ),
          children: textSpanList,
        ),
      ),
    );
  }


  static TextStyle plainRichTextStringStyle({
    required BuildContext context,
    required double plainRichTextStringFontSize,
    Color plainRichTextStringColor = Colors.transparent,
    FontWeight plainRichTextStringFontWeight = FontWeight.normal
  }) {
    return GoogleFonts.urbanist(
      fontSize: plainRichTextStringFontSize,
      fontStyle: FontStyle.normal,
      color: plainRichTextStringColor,
      fontWeight: plainRichTextStringFontWeight,
    );
  }


  static TextStyle plainRichTextStringStyleWithDecoration({
    required BuildContext context,
    required double plainRichTextStringFontSize,
    Color plainRichTextStringColor = Colors.transparent,
    FontWeight plainRichTextStringFontWeight = FontWeight.normal
  }) {
    return GoogleFonts.urbanist(
      fontSize: plainRichTextStringFontSize,
      fontStyle: FontStyle.normal,
      color: plainRichTextStringColor,
      fontWeight: plainRichTextStringFontWeight,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.orange125
    );
  }


}