import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/utils/utils.dart';

class CartController extends GetxController {

  Rx<GetAllProductCartResponse> getAllProductCartResponse = GetAllProductCartResponse().obs;
  Rx<StoresResponseModel> storesResponseModel = StoresResponseModel().obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;

  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  RxBool isIncrease = false.obs;
  RxBool isDecrease = false.obs;
  RxString productId = "".obs;
  RxString cardId = "".obs;
  RxDouble subTotal = 0.0.obs;
  BuildContext context;

  CartController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await addToCartApiService(
        context: context,
        onSuccess: () async {
          await getStoriesApiService(
            context: context,
            onSuccess: () async {
              await getUserProfileApiService(context: context);
            },
          );
        },
      );
    });
  }


  Future<void> addToCartApiService({
    required BuildContext context,
    required Function() onSuccess,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getAddToCartResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(data);
        getAllProductCartResponse.value.data?.carts?.forEach((e){
          subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
        });
        print(subTotal.value);
        onSuccess();
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



  Future<void> getStoriesApiService({
    required BuildContext context,
    required Function() onSuccess,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getAllStoresResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        storesResponseModel.value = StoresResponseModel.fromJson(data);
        onSuccess();
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


  Future<void> increaseCartItemResponse({
    required BuildContext context,
    required String singleProductId,
  }) async {
    await BaseApiUtils.patch(
      url: ApiUtils.getIncreaseCartItem(singleProductId),
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isIncrease.value = false;
        getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(data);
        getAllProductCartResponse.value.data?.carts?.forEach((e){
          subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
        });
        productId.value = "";
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isIncrease.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isIncrease.value = false;
      },
    );
  }



  Future<void> decreaseCartItemResponse({
    required BuildContext context,
    required String singleProductId,
  }) async {
    await BaseApiUtils.patch(
      url: ApiUtils.getDecreaseCartItem(singleProductId),
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isDecrease.value = false;
        getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(data);
        getAllProductCartResponse.value.data?.carts?.forEach((e){
          subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
        });
        productId.value = "";
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDecrease.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isDecrease.value = false;
      },
    );
  }



  Future<void> deleteCartResponse({
    required BuildContext context,
    required String cardId,
  }) async {
    await BaseApiUtils.delete(
      url: ApiUtils.getDeleteCart(cardId),
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(e);
        getAllProductCartResponse.value.data?.carts?.forEach((e){
          subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
        });
        productId.value = " ";
        isDelete.value = false;
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