import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:discount_me_app/res/res.dart';

class UserHomeController {


  static Future<void> getCategoriesApiService({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      String accessToken = "";
      await AppLocalStorage.getString(key: "Login").then((value) {
        accessToken = jsonDecode(value!)["data"]["accessToken"];
      });
      print(accessToken);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}categories",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
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
      String accessToken = "";
      await AppLocalStorage.getString(key: "Login").then((value) {
        accessToken = jsonDecode(value!)["data"]["accessToken"];
      });
      print(accessToken);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}products?sort=-ratings",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
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

  static Future<void> getStoriesApiService({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      String accessToken = "";
      await AppLocalStorage.getString(key: "Login").then((value) {
        accessToken = jsonDecode(value!)["data"]["accessToken"];
      });
      print(accessToken);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}stores?sort=-ratings",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
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