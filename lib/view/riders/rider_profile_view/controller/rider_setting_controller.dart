import 'dart:convert';

import 'package:discount_me_app/view/authenticaion/view/sign_in_screen.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/model/rider_profile_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/res.dart';
import '../../../../utils/utils.dart';

class RiderSettingController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;

  Rx<RiderProfileResponse> riderProfileResponse = RiderProfileResponse().obs;
  BuildContext context;
  RiderSettingController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getRiderProfileController(context: context);
    });
  }

  Future<void> getRiderProfileController({
    required BuildContext context,
  }) async {

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.get(
      url: ApiUtils.riderProfile,
      authorization: accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        riderProfileResponse.value = RiderProfileResponse.fromJson(data);
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


  Future<void> deleteRiderProfileController({
    required BuildContext context,
    required String riderId,
  }) async {

    isSubmit.value = true;

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.delete(
      url: ApiUtils.riderProfileDelete(riderId),
      authorization: accessToken,
      onSuccess: (e,data) async {
        isSubmit.value = false;
        await AppLocalStorage.removeKey(key: "Login");
        await Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );

  }


}