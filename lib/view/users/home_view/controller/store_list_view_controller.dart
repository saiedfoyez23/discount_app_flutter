import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:discount_me_app/view/view.dart';
import '../../../../res/res.dart';
import '../../../../utils/utils.dart';

class StoreListViewController {


  static Future<void> getStoriesApiService({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}stores?sort=-ratings",
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


  static Future<void> getStoriesApiServiceSearchWithLatLongValue({
    required double lat,
    required double long,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);


      print("${AppApiUrl.serverLinkUrl()}stores?coordinates=[${long}, ${lat}]");
      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}stores?coordinates=[${long}, ${lat}]",
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



}