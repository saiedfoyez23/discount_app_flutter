import 'dart:convert';
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';

class SplashController extends GetxController{

  RxBool getStart = LocalStorageUtils.getBool(AppConstantUtils.getStart) == null ? false.obs : LocalStorageUtils.getBool(AppConstantUtils.getStart)!.obs;
  Rx<LoginResponseModel> loginResponseModel = LocalStorageUtils.getString(AppConstantUtils.loginResponse) == null ?
  LoginResponseModel().obs : LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!)).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(milliseconds: 100),() async {
      await redirectionFunction();
    });
  }

  Future<void> redirectionFunction() async {
    if(getStart.value == true) {
      if(loginResponseModel.value.data != null) {
        Map<String, dynamic> decodedToken = parseJwt(loginResponseModel.value.data!.accessToken);
        if(decodedToken['role'] == "user") {
          Get.off(()=>UserHome(selectedIndex: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        } else if (decodedToken['role'] == "rider") {
          Get.off(()=>RiderHome(selectedIndex: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        } else if (decodedToken['role'] == "vendor") {
          Get.off(()=>VendorHome(selectedIndex: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        } else if (decodedToken['role'] == "broker") {
          Get.off(()=>BrokerDashboardView(index: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        }
      } else {
        Get.off(()=> WelcomeView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      }
    }
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