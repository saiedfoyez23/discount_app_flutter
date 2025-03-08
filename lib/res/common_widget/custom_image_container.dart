

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageContainer{


  static Widget assetImageContainer({
    required double height,
    required double width,
    required String assetImage,
    double borderWidth = 0.0,
    Color borderColors = Colors.transparent,
    BoxFit boxFit = BoxFit.contain,
    BoxShape boxShape = BoxShape.rectangle
  }) {
    return Container(
      height: height,
      width: width,
      decoration: borderWidth == 0.0 ? BoxDecoration(
        shape: boxShape,
        image: DecorationImage(
          image: AssetImage(assetImage),
          fit: boxFit
        )
      ) : BoxDecoration(
          border: Border.all(color: borderColors,width: borderWidth),
          shape: boxShape,
          image: DecorationImage(
              image: AssetImage(assetImage),
              fit: boxFit
          )
      ),
    );
  }


  static Widget fileImageContainer({
    required double height,
    required double width,
    required File file,
    double borderWidth = 0.0,
    Color borderColors = Colors.transparent,
    BoxFit boxFit = BoxFit.contain,
    BoxShape boxShape = BoxShape.rectangle
  }) {
    return Container(
      height: height,
      width: width,
      decoration: borderWidth == 0.0 ? BoxDecoration(
          shape: boxShape,
          image: DecorationImage(
              image: FileImage(file),
              fit: boxFit
          )
      ) : BoxDecoration(
          border: Border.all(color: borderColors,width: borderWidth),
          shape: boxShape,
          image: DecorationImage(
              image: FileImage(file),
              fit: boxFit
          )
      ),
    );
  }



}



