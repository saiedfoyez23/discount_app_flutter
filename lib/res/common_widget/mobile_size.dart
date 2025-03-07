

import '../app_const/import_list.dart';

class ScreenSize {
  static double smallWidth=360.0;
  static double smallHeight=360.0;

  static double mediumWidth=1024.0;
  static double mediumHeight=1350.0;

  static double largeWidth=1280.0;
  static double largeHeight=1880.0;

  void initSize(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
  }



}