import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double designWidth = 428;
  static const double designHeight = 926;

  static Size _screenSize({required BuildContext context}) {
    return MediaQuery.sizeOf(context);
  }

  /// Width ratio
  static double widthRatio({required BuildContext context}) {
    final screenWidth = _screenSize(context: context).width;
    return screenWidth / designWidth;
  }

  /// Height ratio
  static double heightRatio({required BuildContext context}) {
    final screenHeight = _screenSize(context: context).height;
    return screenHeight / designHeight;
  }

  /// Width scaling
  static double scaleWidth({
    required BuildContext context,
    required num width,
  }) {
    return width * widthRatio(context: context);
  }

  /// Height scaling
  static double scaleHeight({
    required BuildContext context,
    required num height,
  }) {
    return height * heightRatio(context: context);
  }

  static double getLeftMarginPadding({
    required BuildContext context,
    required num width,
  }) {
    return scaleWidth(context: context, width: width);
  }

  static double getRightMarginPadding({
    required BuildContext context,
    required num width,
  }) {
    return scaleWidth(context: context, width: width);
  }

  static double getTopMarginPadding({
    required BuildContext context,
    required num height,
  }) {
    return scaleHeight(context: context, height: height);
  }

  static double getBottomMarginPadding({
    required BuildContext context,
    required num height,
  }) {
    return scaleHeight(context: context, height: height);
  }

  static double getHorizontalMarginPadding({
    required BuildContext context,
    required num width,
  }) {
    return scaleWidth(context: context, width: width);
  }

  static double getVerticalMarginPadding({
    required BuildContext context,
    required num height,
  }) {
    return scaleHeight(context: context, height: height);
  }

  static double getFontWidth({
    required BuildContext context,
    required num fontSize,
  }) {
    return scaleWidth(context: context, width: fontSize);
  }

  static double getFontHeight({
    required BuildContext context,
    required num fontSize,
  }) {
    return scaleHeight(context: context, height: fontSize);
  }

  static double getRadiusWidth({
    required BuildContext context,
    required num radius,
  }) {
    return scaleWidth(context: context, width: radius);
  }

  static double getRadiusHeight({
    required BuildContext context,
    required num radius,
  }) {
    return scaleHeight(context: context, height: radius);
  }

  static double getFontSize({
    required BuildContext context,
    required num fontSize,
  }) {
    final fontHeight = getFontHeight(context: context, fontSize: fontSize);
    final fontWidth = getFontWidth(context: context, fontSize: fontSize);
    return fontHeight < fontWidth ? fontHeight : fontWidth;
  }

  static double getRadius({
    required BuildContext context,
    required num borderRadius,
  }) {
    final radiusHeight = getRadiusHeight(context: context, radius: borderRadius,);
    final radiusWidth = getRadiusWidth(context: context, radius: borderRadius);
    return radiusHeight < radiusWidth ? radiusHeight : radiusWidth;
  }
}

class DesignUtils {
  static num designHeight({required BuildContext context}) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? 926 : 428;
  }

  static num designWidth({required BuildContext context}) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? 428 : 926;
  }
}

extension ScreenUtils on num {
  double h(BuildContext context) {
    return ResponsiveUtils.scaleHeight(context: context, height: this);
  }

  double w(BuildContext context) {
    return ResponsiveUtils.scaleWidth(context: context, width: this);
  }

  double rpm(BuildContext context) {
    return ResponsiveUtils.getRightMarginPadding(context: context, width: this);
  }

  double lpm(BuildContext context) {
    return ResponsiveUtils.getLeftMarginPadding(context: context, width: this);
  }

  double tpm(BuildContext context) {
    return ResponsiveUtils.getTopMarginPadding(context: context, height: this);
  }

  double bpm(BuildContext context) {
    return ResponsiveUtils.getBottomMarginPadding(context: context, height: this,);
  }

  double vpm(BuildContext context) {
    return ResponsiveUtils.getVerticalMarginPadding(context: context, height: this,);
  }

  double hpm(BuildContext context) {
    return ResponsiveUtils.getHorizontalMarginPadding(context: context, width: this,);
  }

  double sp(BuildContext context) {
    return ResponsiveUtils.getFontSize(context: context, fontSize: this);
  }

  double r(BuildContext context) {
    return ResponsiveUtils.getRadius(context: context, borderRadius: this);
  }
}
