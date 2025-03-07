import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/res.dart';

class OtpVerifyController extends GetxController {

  RxInt timeCounter = 120.obs;
  RxBool isReset = false.obs;
  RxBool isSubmit = false.obs;
  Rx<TextEditingController> otp1 = TextEditingController().obs;
  Rx<TextEditingController> otp2 = TextEditingController().obs;
  Rx<TextEditingController> otp3 = TextEditingController().obs;
  Rx<TextEditingController> otp4 = TextEditingController().obs;
  Rx<TextEditingController> otp5 = TextEditingController().obs;
  Rx<TextEditingController> otp6 = TextEditingController().obs;

  Future<void> otpTimer() async {
    Future.delayed(Duration(seconds: 1), () async {
      if(timeCounter > 0) {
        timeCounter.value = timeCounter.value - 1;
        otpTimer();
      } else {
        timeCounter.value = 0;
      }
    });
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 1),() async {
      await otpTimer();
    });
  }

  static Future<void> getResetOtpResponse({
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


  static Future<void> getVerifyOtpResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{
      var response = await Dio().post(
        "${AppApiUrl.serverLinkUrl()}/auth/verify-otp",
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