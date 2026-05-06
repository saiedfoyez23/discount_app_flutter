import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingHelperWidget {

  static Widget loadingHelperWidget({
    required BuildContext context,
    double height = 56,
    double width = 438,
    Color backgroundColor = Colors.transparent,
    Color loaderColor = ColorUtils.secondaryColor,
    double loaderSize = 30.0,
    double borderRadius = 6,
  }) {
    return Container(
      height: height.h(context),
      width: width.w(context),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
      ),
      child: Center(
        child: SpinKitFoldingCube(
          color: loaderColor,
          size: loaderSize.r(context),
        ),
      ),
    );
  }


  static Widget loadingHelperWithoutHeightWidget({
    required BuildContext context,
    double height = 56,
    Color backgroundColor = Colors.transparent,
    Color loaderColor = ColorUtils.secondaryColor,
    double loaderSize = 30.0,
    EdgeInsetsGeometry? padding,
    double borderRadius = 6,
  }) {
    return Container(
      height: height.h(context),
      padding: padding ?? EdgeInsets.symmetric(
        vertical: 14.5.vpm(context),
        horizontal: 14.5.hpm(context),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r(context)),
      ),
      child: Center(
        child: SpinKitFoldingCube(
          color: loaderColor,
          size: loaderSize.r(context),
        ),
      ),
    );
  }

  static Widget loadingHelper({
    Key? key,
    required Color color,
    double size = 30.0,
    required BuildContext context,
  }) {
    return Center(
      key: key,
      child: SpinKitFoldingCube(
        color: color,
        size: size.r(context),
      ),
    );
  }


}