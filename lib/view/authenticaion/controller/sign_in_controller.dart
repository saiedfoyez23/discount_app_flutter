import 'dart:convert';
import 'package:discount_me_app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:discount_me_app/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';

class SignInController extends GetxController {

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isSubmit = false.obs;

  RxBool isPasswordVisible = true.obs;
  // For first password field

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


  Future<void> getUserLoginResponse({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    await BaseApiUtils.post(
      url: ApiUtils.loginResponse,
      data: data,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await LocalStorageUtils.setString(AppConstantUtils.loginResponse, jsonEncode(data));
        Map<String, dynamic> decodedToken = parseJwt(data["data"]["accessToken"]);
        print(decodedToken['role']);
        if(decodedToken['role'] == "user") {
          Get.off(()=>UserDashboardView(index: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
          isSubmit.value = false;
        } else if (decodedToken['role'] == "rider") {
          Get.off(()=>RiderDashboardView(index: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
          isSubmit.value = false;
        } else if (decodedToken['role'] == "vendor") {
          Get.off(()=>VendorDashboardView(index: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
          isSubmit.value = false;
        } else if (decodedToken['role'] == "broker") {
          Get.off(()=>BrokerDashboardView(index: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
          isSubmit.value = false;
        }
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );
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


