import 'dart:convert';

import 'package:discount_me_app/res/res.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 100),() async {
      AppLocalStorage.getBool(key: "getStart").then((gvalue) {
        if(gvalue == true) {
          AppLocalStorage.getString(key: "Login").then((value) {
            if(value != null && value != "") {
              Map<String, dynamic> decodedToken = parseJwt(jsonDecode(value)["data"]["accessToken"]);
              if(decodedToken['role'] == "user") {
                Get.off(()=>UserHome(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
              }
            } else {
              Get.off(()=> WelcomeScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
            }
          });
        }
      });
    });
  }


  static Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
      case 3:
        output += '=' * (4 - output.length % 4);
        break;
    }

    return utf8.decode(base64Url.decode(output));
  }

}