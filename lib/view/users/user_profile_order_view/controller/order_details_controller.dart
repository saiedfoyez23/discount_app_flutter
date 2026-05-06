import 'dart:convert';

import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

class OrderDetailsController extends GetxController {

  RxBool isLoading = false.obs;
  BuildContext context;
  String orderId;
  OrderDetailsController({required this.orderId,required this.context});
  Rx<GetOrderDetailsRetrievedResponseModel> getOrderDetailsRetrievedResponseModel = GetOrderDetailsRetrievedResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getOrderDetailsController(context: context, orderId: orderId);
    });
  }


  Future<void> getOrderDetailsController({
    required BuildContext context,
    required String orderId,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getOrderDetails(orderId),
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getOrderDetailsRetrievedResponseModel.value = GetOrderDetailsRetrievedResponseModel.fromJson(data);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }



}