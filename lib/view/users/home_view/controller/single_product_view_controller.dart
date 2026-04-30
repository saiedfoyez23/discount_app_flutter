import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/utils/utils.dart';
import '../../../../res/res.dart';

class SingleProductViewController {


  static Future<void> getSingleProductViewApiService({
    required String productId,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}products/${productId}",
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