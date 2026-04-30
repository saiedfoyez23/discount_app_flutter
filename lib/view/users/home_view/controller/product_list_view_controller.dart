import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/view.dart';
import '../../../../res/res.dart';

class ProductListViewController {


  static Future<void> getCategoriesApiService({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}categories",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
        }),
      );
      print(response.data);
      if (response.statusCode == 200) {
        onSuccess(response.data);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<void> getProductsApiService({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}products",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}',
        }),
      );
      print(response.data);
      if (response.statusCode == 200) {
        onSuccess(response.data);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getProductsByCategoryApiService({
    required String categoryId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}products?category=${categoryId}",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}',
        }),
      );
      print(response.data);
      if (response.statusCode == 200) {
        onSuccess(response.data);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<void> getProductsByStoreApiService({
    required String storeId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);


      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}products?store=${storeId}",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}',
        }),
      );
      print(response.data);
      if (response.statusCode == 200) {
        onSuccess(response.data);
      } else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }
  }


}