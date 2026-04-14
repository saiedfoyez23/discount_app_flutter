import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../res/res.dart';

class SingleProductViewController {


  static Future<void> getSingleProductViewApiService({
    required String productId,
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
        "${AppApiUrl.serverLinkUrl()}products/${productId}",
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