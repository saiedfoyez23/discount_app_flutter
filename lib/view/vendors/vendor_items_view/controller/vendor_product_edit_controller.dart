import 'dart:convert';
import 'package:discount_me_app/view/users/home_view/model/single_product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/res.dart';
import '../../../../utils/utils.dart';

class VendorProductEditController extends GetxController {

  BuildContext context;
  String productId;
  VendorProductEditController({required this.context,required this.productId});
  RxBool isLoading = false.obs;
  Rx<SingleProductResponseModel> singleProductResponseModel = SingleProductResponseModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorProductDetailsController(context: context, productId: productId);
    });
  }


  Future<void> getVendorProductDetailsController({
    required BuildContext context,
    required String productId,
  }) async {

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.get(
      url: ApiUtils.productDetails(productId),
      authorization: accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        singleProductResponseModel.value = SingleProductResponseModel.fromJson(data);
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