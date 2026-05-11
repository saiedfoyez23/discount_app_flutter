import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/utils/utils.dart';

class ExploreController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<CategoriesResponseModel> categoriesResponseModel = CategoriesResponseModel().obs;
  Rx<ProductsResponseModel> productsResponseModel = ProductsResponseModel().obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  BuildContext context;
  RxList<Products> products = <Products>[].obs;
  ExploreController({required this.context});
  RxString updatedCategoryId = "".obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getCategoriesApiService(
        context: context,
        onSuccess: () async {
          await getProductsApiService(
            context: context,
            onSuccess: () async {
              await getUserProfileApiService(
                context: context,
              );
            },
          );
        },
      );
    });
  }


  Future<void> getCategoriesApiService({
    required BuildContext context,
    required Function() onSuccess,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.categoriesResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        categoriesResponseModel.value = CategoriesResponseModel.fromJson(data);
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


  Future<void> getProductsApiService({
    required BuildContext context,
    required Function() onSuccess,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getAllExploreProductsResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        productsResponseModel.value = ProductsResponseModel.fromJson(data);
        products.value = productsResponseModel.value.data!.data!;
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


  Future<void> getSearchProductsApiService({
    required BuildContext context,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getAllExploreProductsResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        productsResponseModel.value = ProductsResponseModel.fromJson(data);
        products.value = productsResponseModel.value.data!.data!;
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
        userProfileResponseModel.value = UserProfileResponseModel.fromJson(data);
        isLoading.value = false;
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


  Future<void> getProductsByCategoryApiService({
    required BuildContext context,
    required String categoryId,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getCategoryWiseProducts(categoryId),
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        productsResponseModel.value = ProductsResponseModel.fromJson(data);
        products.value = productsResponseModel.value.data!.data!;
        isLoading.value = false;
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