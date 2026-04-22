import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import '../../../../utils/utils.dart';

class BrokerChangePasswordController extends GetxController {
  RxBool isCurrentPasswordVisible = true.obs;
  RxBool isNewPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;
  Rx<TextEditingController> currentPasswordController = TextEditingController().obs;
  Rx<TextEditingController> newPasswordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  Rx<GetBrokerProfileResponseModel> getBrokerProfileResponseModel = GetBrokerProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;

  BuildContext context;
  BrokerChangePasswordController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorProfileController(context: context);
    });
  }


  Future<void> getVendorProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.brokersProfile,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getBrokerProfileResponseModel.value = GetBrokerProfileResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }


  Future<void> brokerChangePasswordController({
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    await BaseApiUtils.post(
      url: ApiUtils.changePassword,
      data: data,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await LocalStorageUtils.remove(AppConstantUtils.loginResponse);
        await Get.offAll(()=>SignInScreen(),duration: Duration(milliseconds: 100));
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


}