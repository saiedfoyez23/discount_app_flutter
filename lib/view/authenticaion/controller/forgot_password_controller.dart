import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../res/res.dart';

class ForgotPasswordController extends GetxController{

  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool isSubmit = false.obs;

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
    isSubmit.value = false;
  }


  static Future<void> getForgotPasswordResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{
      var response = await Dio().post(
        "${AppApiUrl.serverLinkUrl()}/auth/send-otp",
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