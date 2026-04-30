import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/view.dart';

class BrokerSettingController extends GetxController {

  Rx<GetBrokerProfileResponseModel> getBrokerProfileResponseModel = GetBrokerProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isDelete = false.obs;

  BuildContext context;
  BrokerSettingController({required this.context});

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



  Future<void> deleteVendorProfileController({
    required BuildContext context,
    required String brokerId,
  }) async {
    BaseApiUtils.delete(
      url: ApiUtils.deleteBrokerProfile(brokerId),
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isDelete.value = false;
        getBrokerProfileResponseModel.value = GetBrokerProfileResponseModel.fromJson(data);
        await LocalStorageUtils.remove(AppConstantUtils.loginResponse);
        await Get.offAll(()=>SignInView(),duration: Duration(milliseconds: 100));
      },
      onFail: (e,data) {
        isDelete.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        isDelete.value = false;
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );
  }

}