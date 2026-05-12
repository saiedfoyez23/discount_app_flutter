import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import '../../../../utils/utils.dart';

class UserSettingController extends GetxController {


  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxBool isDelete = false.obs;

  BuildContext context;
  UserSettingController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getUserProfileApiService(context: context);
    });
  }


  Future<void> getUserProfileApiService({
    required BuildContext context,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getUserProfileResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        userProfileResponseModel.value = UserProfileResponseModel.fromJson(data);
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



  Future<void> deleteUserProfileController({
    required BuildContext context,
    required String userId,
  }) async {
    BaseApiUtils.delete(
      url: ApiUtils.deleteUserProfile(userId),
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isDelete.value = false;
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