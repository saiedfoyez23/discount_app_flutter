import 'package:flutter/foundation.dart';


class AppApiUrl {

  static String serverLinkUrl() {
    if(kDebugMode){
      return "http://159.223.184.53:5007/api/v1/";
    }else{
      return "http://159.223.184.53:5007/api/v1/";
    }
  }



}