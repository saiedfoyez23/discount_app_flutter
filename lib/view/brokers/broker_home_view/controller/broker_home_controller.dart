import 'dart:convert';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';

class BrokerHomeController extends GetxController {

  Rx<GetBrokerProfileResponseModel> getBrokerProfileResponseModel = GetBrokerProfileResponseModel().obs;
  RxBool isLoading = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!)).obs;
  BuildContext context;
  BrokerHomeController({required this.context});

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


}