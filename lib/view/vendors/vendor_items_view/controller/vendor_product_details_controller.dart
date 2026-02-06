import 'dart:async';
import 'dart:convert';
import 'package:discount_me_app/view/users/home_view/model/single_product_response_model.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/view/vendor_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/res.dart';
import '../../../../utils/utils.dart';

class VendorProductDetailsController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  RxBool isAdd = false.obs;
  Rx<SingleProductResponseModel> singleProductResponseModel = SingleProductResponseModel().obs;
  final BuildContext context;
  final String productId;
  Rx<PageController> pageController = PageController(initialPage: 0).obs; // Start at the first page
  var currentPage = 0.obs;
  Timer? _timer;

  VendorProductDetailsController({required this.productId,required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getSingleProductViewController(context: context, productId: productId);
    });
  }



  void onPageChanged(int page) {
    currentPage.value = page;
  }

  Future<void> startAutoPlay() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage.value < 2) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      if (pageController.value.hasClients) {
        pageController.value.animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 350),
          curve: Curves.linearToEaseOut, // Swapping-like effect
        );
      }
    });
  }


  Future<void> getSingleProductViewController({
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


  Future<void> getProductDeleteController({
    required BuildContext context,
    required String productId,
  }) async {

    isDelete.value = true;

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.delete(
      url: ApiUtils.productDelete(productId),
      authorization: accessToken,
      onSuccess: (e,data) async {
        Get.back();
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
        Get.off(()=>VendorHome(selectedIndex: 2,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDelete.value = false;
      },
    );

  }

}