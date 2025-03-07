import 'package:flutter/cupertino.dart';

class CustomSpaceWidget {


  static Widget spacerWidget({
    double spaceHeight = 0.0,
    double spaceWidth = 0.0,
  }) {
    if(spaceHeight != 0.0 && spaceWidth != 0.0) {
      return SizedBox(
        height: spaceHeight,
        width: spaceWidth,
      );
    }else if(spaceHeight != 0.0 && spaceWidth == 0.0) {
      return SizedBox(
        height: spaceHeight,
      );
    }else if(spaceHeight == 0.0 && spaceWidth != 0.0) {
      return SizedBox(
        width: spaceWidth,
      );
    }else {
      return const SizedBox.shrink();
    }
  }


}