import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import '../../../../utils/utils.dart';

class BrokerPaymentFreeTrailController extends GetxController {

  Future<void> getPaymentController({
    required BuildContext context,
    required String paymentUrl
  }) async {

    BaseApiUtils.get(
      url: paymentUrl,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await LocalStorageUtils.remove(AppConstantUtils.loginResponse);
        await Get.offAll(()=>SignInView(),duration: Duration(milliseconds: 100));
      },
      onFail: (e,data) async {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        await LocalStorageUtils.remove(AppConstantUtils.loginResponse);
        await Get.offAll(()=>SignInView(),duration: Duration(milliseconds: 100));
      },
      onExceptionFail: (e,data) async {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        await LocalStorageUtils.remove(AppConstantUtils.loginResponse);
        await Get.offAll(()=>SignInView(),duration: Duration(milliseconds: 100));
      },
    );

  }



}