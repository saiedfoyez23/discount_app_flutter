import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextContainer {


  static Widget plainTextContainerWidgetWithHeightWidth({
    Color plainTextContainerColor = Colors.transparent,
    required double plainTextContainerHeight,
    required double plainTextContainerWidth,
    double plainTextContainerBorderRadius = 0.0,
    BoxShape plainTextContainerBoxShape = BoxShape.rectangle,
    Alignment plainTextContainerAlignment = Alignment.center,
    required String plainTextString,
    Color plainTextStringColor = Colors.transparent,
    TextAlign plainTextStringTextAlign = TextAlign.center,
    required double plainTextStringFontSize,
    FontWeight plainTextStringFontWeight = FontWeight.w400,
  }) {
    return Container(
      height: plainTextContainerHeight,
      width: plainTextContainerWidth,
      decoration: plainTextContainerBorderRadius == 0.0 ?
      BoxDecoration(
        color: plainTextContainerColor,
        shape: plainTextContainerBoxShape,
      ) :
      BoxDecoration(
          color: plainTextContainerColor,
          shape: plainTextContainerBoxShape,
          borderRadius: BorderRadius.circular(plainTextContainerBorderRadius)
      ),
      alignment: plainTextContainerAlignment,
      child: Text(
        plainTextString,
        textAlign: plainTextStringTextAlign,
        style: GoogleFonts.urbanist(
          fontSize: plainTextStringFontSize,
          fontStyle: FontStyle.normal,
          color: plainTextStringColor,
          fontWeight: plainTextStringFontWeight,
        ),
      ),
    );
  }


  static Widget plainTextContainerWidgetWithoutHeightWidth({
    Color plainTextContainerColor = Colors.transparent,
    double plainTextContainerBorderRadius = 0.0,
    BoxShape plainTextContainerBoxShape = BoxShape.rectangle,
    Alignment plainTextContainerAlignment = Alignment.center,
    required String plainTextString,
    Color plainTextStringColor = Colors.transparent,
    TextAlign plainTextStringTextAlign = TextAlign.center,
    required double plainTextStringFontSize,
    FontWeight plainTextStringFontWeight = FontWeight.w400,
  }) {
    return Container(
      decoration: plainTextContainerBorderRadius == 0.0 ?
      BoxDecoration(
        color: plainTextContainerColor,
        shape: plainTextContainerBoxShape,
      ) :
      BoxDecoration(
          color: plainTextContainerColor,
          shape: plainTextContainerBoxShape,
          borderRadius: BorderRadius.circular(plainTextContainerBorderRadius)
      ),
      alignment: plainTextContainerAlignment,
      child: Text(
        plainTextString,
        textAlign: plainTextStringTextAlign,
        style: GoogleFonts.urbanist(
          fontSize: plainTextStringFontSize,
          fontStyle: FontStyle.normal,
          color: plainTextStringColor,
          fontWeight: plainTextStringFontWeight,
        ),
      ),
    );
  }



}