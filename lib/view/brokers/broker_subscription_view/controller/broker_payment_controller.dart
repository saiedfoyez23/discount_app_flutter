import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import 'package:discount_me_app/view/view.dart';

class BrokerPaymentController extends GetxController {


  Future<void> getPaymentController({
    required BuildContext context,
    required String paymentUrl
  }) async {

    BaseApiUtils.get(
      url: paymentUrl,
      onSuccess: (e,data) async {
        Get.off(()=>BrokerDashboardView(index: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
      },
      onFail: (e,data) {
        Get.off(()=>BrokerDashboardView(index: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        Get.off(()=>BrokerDashboardView(index: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );

  }

}