import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../res/res.dart';

class SingleStoreViewController {


  static Future<void> getSingleStoreViewApiService({
    required String storeId,
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
        "${AppApiUrl.serverLinkUrl()}stores/${storeId}",
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


  static Future<void> getAllProductByStoreIdApiService({
    required String storeId,
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
        "${AppApiUrl.serverLinkUrl()}products?store=${storeId}",
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