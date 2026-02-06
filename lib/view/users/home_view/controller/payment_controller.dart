import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

class PaymentController extends GetxController {


  Future<void> getPaymentController({
    required BuildContext context,
    required String paymentUrl
  }) async {


    BaseApiUtils.get(
      url: paymentUrl,
      onSuccess: (e,data) async {
        Get.off(()=>OrderCompleteView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
      },
      onFail: (e,data) {
        Get.off(()=>OrderScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        Get.off(()=>OrderScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );

  }



}