import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/res.dart';

class CreatePasswordController extends GetxController{

  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isSubmit = false.obs;

  var isNewPasswordVisible = false.obs;   // For first password field
  var isNewConfirmPasswordVisible = false.obs; // For confirm password field

  Future<void> toggleNewPasswordVisibility() async {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  Future<void> toggleNewConfirmPasswordVisibility() async {
    isNewConfirmPasswordVisible.value = !isNewConfirmPasswordVisible.value;
  }


  static Future<void> getResetPasswordResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{
      var response = await Dio().post(
        "${AppApiUrl.serverLinkUrl()}/auth/reset-forgotten-password",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }),
        data: jsonEncode(data),
      );
      print(response.data["message"]);
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }

  }


}