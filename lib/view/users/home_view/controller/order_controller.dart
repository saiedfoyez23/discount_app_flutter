import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:discount_me_app/res/res.dart';
import '../../../../utils/utils.dart';
import '../../../view.dart';

class OrderController {


  static Future<void> addProductToCartResponse({
    required Map<String,dynamic> data,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      print("${AppApiUrl.serverLinkUrl()}carts");
      var response = await Dio().post(
        "${AppApiUrl.serverLinkUrl()}carts",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
        }),
        data: jsonEncode(data),
      );
      print(response.data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }

  }


  static Future<void> addToCartResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);


      print("${AppApiUrl.serverLinkUrl()}carts");
      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}carts",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
        }),
      );
      print(response.data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }

  }

  static Future<void> increaseCartItemResponse({
    required String productId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);


      print("${AppApiUrl.serverLinkUrl()}carts/increase/${productId}");
      var response = await Dio().patch(
        "${AppApiUrl.serverLinkUrl()}carts/increase/${productId}",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
        }),
      );
      print(response.data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }

  }

  static Future<void> decreaseCartItemResponse({
    required String productId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);


      print("${AppApiUrl.serverLinkUrl()}carts/decrease/${productId}");
      var response = await Dio().patch(
        "${AppApiUrl.serverLinkUrl()}carts/decrease/${productId}",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
        }),
      );
      print(response.data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }

  }

  static Future<void> deleteCartResponse({
    required String cardId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);


      print("${AppApiUrl.serverLinkUrl()}carts/${cardId}");
      var response = await Dio().delete(
        "${AppApiUrl.serverLinkUrl()}carts/${cardId}",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
        }),
      );
      print(response.data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }

  }



}