import 'dart:convert';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';

class UserProductListController extends GetxController {

  RxBool isLoading = false.obs;

  Rx<CategoriesResponseModel> categoriesResponseModel = CategoriesResponseModel().obs;
  Rx<ProductsResponseModel> productsResponseModel = ProductsResponseModel().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  BuildContext context;
  String categoryId = "";
  String storeId = "";
  RxList<Products> products = <Products>[].obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  UserProductListController({required this.context,required this.categoryId,required this.storeId});
  RxString updatedCategoryId = "".obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    updatedCategoryId.value = categoryId;
    Future.delayed(Duration(seconds: 1),() async {
      await getCategoriesApiService(context: context);
      if(categoryId == "" && storeId == "") {
        await getProductsApiService(context: context);
      } else {
        if(categoryId != "") {
          await getProductsByCategoryApiService(categoryId: categoryId, context: context,);
        } else {
          await getProductsByStoreApiService(storeId: storeId, context: context,);
        }
      }
      await getUserProfileApiService(context: context,);
    });
  }



  Future<void> getCategoriesApiService({
    required BuildContext context,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.categoriesResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        categoriesResponseModel.value = CategoriesResponseModel.fromJson(data);
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
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getAllProductResponse,
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


  Future<void> getProductsBySingleCategoryApiService({
    required BuildContext context,
    required String categoryId,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getProductsByCategoryApiService(categoryId),
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



  Future<void> getProductsByCategoryApiService({
    required BuildContext context,
    required String categoryId,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getProductsByCategoryApiService(categoryId),
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


  Future<void> getProductsByStoreApiService({
    required BuildContext context,
    required String storeId,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getProductsByStoreApiService(storeId),
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

}