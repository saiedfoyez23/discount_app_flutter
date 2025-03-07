import 'package:flutter/material.dart';
import '../res.dart';


class ResponsiveUtils {

  static double getHeight({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 926) {
      return (926 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 926) {
      return (428 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    }
  }

  static double getWidth({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 428) {
      return (428 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 428) {
      return (926 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    }
  }

  static double getLeftMarginPadding({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 428) {
      return (428 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 428) {
      return (926 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    }
  }

  static double getRightMarginPadding({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 428) {
      return (428 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 428) {
      return (926 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    }
  }

  static double getTopMarginPadding({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 926) {
      return (926 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 926) {
      return (428 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    }
  }

  static double getBottomMarginPadding({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 926) {
      return (926 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 926) {
      return (428 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    }
  }


  static double getHorizontalMarginPadding({required BuildContext context,required num width}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && width == 428) {
      return (428 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && width == 428) {
      return (926 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else {
      return (width * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    }
  }

  static double getVerticalMarginPadding({required BuildContext context,required num height}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && height == 926) {
      return (926 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && height == 926) {
      return (428 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else {
      return (height * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    }
  }


  static double getFontWidth({required BuildContext context,required num fontSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && fontSize == 428) {
      return (428 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && fontSize == 428) {
      return (926 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else {
      return (fontSize * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    }
  }

  static double getFontHeight({required BuildContext context,required num fontSize}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && fontSize == 926) {
      return (926 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && fontSize == 926) {
      return (428 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else {
      return (fontSize * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    }
  }


  static double getRadiusWidth({required BuildContext context,required num radius}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && radius == 428) {
      return (428 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && radius == 428) {
      return (926 * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    } else {
      return (radius * (MediaQuery.sizeOf(context).width / DesignUtils.designWidth(context: context)));
    }
  }

  static double getRadiusHeight({required BuildContext context,required num radius}) {
    if(MediaQuery.of(context).orientation.name == "portrait" && radius == 926) {
      return (926 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else if(MediaQuery.of(context).orientation.name == "landscape" && radius == 926) {
      return (428 * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    } else {
      return (radius * (MediaQuery.sizeOf(context).height / DesignUtils.designHeight(context: context)));
    }
  }

  static double getFontSize({required BuildContext context,required num fontSize}) {
    if(getFontHeight(context: context, fontSize: fontSize) < getFontWidth(context: context, fontSize: fontSize)) {
      return getFontHeight(context: context, fontSize: fontSize);
    }else {
      return getFontWidth(context: context, fontSize: fontSize);
    }
  }


  static double getRadius({required BuildContext context,required num borderRadius}) {
    if(getRadiusHeight(context: context, radius: borderRadius) < getRadiusWidth(context: context, radius: borderRadius)) {
      return getRadiusHeight(context: context, radius: borderRadius);
    }else {
      return getRadiusWidth(context: context, radius: borderRadius);
    }
  }






}