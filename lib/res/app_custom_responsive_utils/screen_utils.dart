import 'package:flutter/material.dart';
import '../res.dart';



extension ScreenUtils on num {
  double h(BuildContext context) {
    return ResponsiveUtils.getHeight(context: context, height: this);
  }
  double w(BuildContext context) {
    return ResponsiveUtils.getWidth(context: context, width: this);
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
    return ResponsiveUtils.getBottomMarginPadding(context: context, height: this);
  }
  double vpm(BuildContext context) {
    return ResponsiveUtils.getVerticalMarginPadding(context: context, height: this);
  }
  double hpm(BuildContext context) {
    return ResponsiveUtils.getHorizontalMarginPadding(context: context, width: this);
  }
  double sp(BuildContext context) {
    return ResponsiveUtils.getFontSize(context: context, fontSize: this);
  }
  double r(BuildContext context) {
    return ResponsiveUtils.getRadius(context: context, borderRadius: this);
  }
}