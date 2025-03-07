import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:discount_me_app/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isSubmit = false.obs;

  var isPasswordVisible = false.obs;   // For first password field

  Future<void> togglePasswordVisibility() async {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(milliseconds: 100),() async {
      await resetFunction();
    });
  }


  Future<void> resetFunction() async {
    emailController.value = TextEditingController();
    passwordController.value = TextEditingController();
    isSubmit.value = false;
  }


  static Future<void> getUserLoginResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{
      var response = await Dio().post(
        "${AppApiUrl.serverLinkUrl()}/auth/login",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
        data: jsonEncode(data),
      );
      print(response.data["data"]["accessToken"]);
      if(response.statusCode == 200 || response.statusCode == 201) {
        await AppLocalStorage.setString(key: "Login", value: jsonEncode(response.data));
        Map<String, dynamic> decodedToken = parseJwt(response.data["data"]["accessToken"]);
        print(decodedToken['role']);
        onSuccess(response.data["message"],decodedToken['role']);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
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


