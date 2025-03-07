import 'package:flutter/material.dart';

class DesignUtils {

  static num designHeight({required BuildContext context}) {
    if(MediaQuery.of(context).orientation.name == "portrait") {
      return 926;
    }else {
      return 428;
    }
  }


  static num designWidth({required BuildContext context}) {
    if(MediaQuery.of(context).orientation.name == "portrait") {
      return 428;
    }else {
      return 926;
    }
  }
}