

import 'package:flutter/cupertino.dart';

class CustomImageContainer{


  static Widget assetImageContainer({
    required double height,
    required double width,
    required String assetImage,
    BoxFit boxFit = BoxFit.contain,
    BoxShape boxShape = BoxShape.rectangle
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: boxShape,
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: boxFit
        )
      ),
    );
  }



}



