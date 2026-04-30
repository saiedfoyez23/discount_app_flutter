import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:discount_me_app/utils/utils.dart';
import '../../../../res/res.dart';
import '../../../view.dart';

class VendorProfileDetailsController {

  static Future<void> getVendorProfileApiService({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}vendors/profile",
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