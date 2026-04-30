import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

class VendorPaymentController extends GetxController {

  Future<void> getPaymentController({
    required BuildContext context,
    required String paymentUrl
  }) async {

    BaseApiUtils.get(
      url: paymentUrl,
      onSuccess: (e,data) async {
        Get.off(()=>VendorHome(selectedIndex: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
      },
      onFail: (e,data) {
        Get.off(()=>VendorHome(selectedIndex: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
      onExceptionFail: (e,data) {
        Get.off(()=>VendorHome(selectedIndex: 0),duration: const Duration(milliseconds: 100),preventDuplicates: false);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
      },
    );

  }


}