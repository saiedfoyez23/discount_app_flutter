import 'package:flutter/foundation.dart';


class AppApiUrl {

  static String serverLinkUrl() {
    if(kDebugMode){
      //return "http://192.168.10.204:5007/api/v1/";
      return "https://1882-103-159-73-131.ngrok-free.app/api/v1/";
    }else{
      //return "http://192.168.10.204:5007/api/v1/";
      return "https://1882-103-159-73-131.ngrok-free.app/api/v1/";
    }
  }



}