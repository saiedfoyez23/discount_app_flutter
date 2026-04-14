import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;

import '../../../../res/res.dart';


class UserProfileEditController {


  static Future<void> getUserNameUpdateResponse({
    required String name,
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

      Map<String,dynamic> data = {
        "name": name,
      };

      print(jsonEncode(data));

      dio.FormData formData = dio.FormData.fromMap({
        "data": jsonEncode(data),
      });




      var response = await dio.Dio().put(
        "${AppApiUrl.serverLinkUrl()}users",
        data: formData,
        options: dio.Options(headers: <String, String>{
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer, ${accessToken}'
        }),
      );
      print(jsonEncode(response.data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getUserImageUpdateResponse({
    required String name,
    required File image,
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

      String? mimeTypeImage = image.path == "" ? "" : CustomMimeType.getMimeType(image.path);

      Map<String,dynamic> data = {
        "name": name,
      };

      print(jsonEncode(data));



      dio.FormData formData = dio.FormData.fromMap({
        "data": jsonEncode(data),
        "image": image.path != "" ? await dio.MultipartFile.fromFile(image.path,filename: image.path.split('/').last,contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last)) : "",
      });




      var response = await dio.Dio().put(
        "${AppApiUrl.serverLinkUrl()}users",
        data: formData,
        options: dio.Options(headers: <String, String>{
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer, ${accessToken}'
        }),
      );
      print(jsonEncode(response.data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> getUserUpdateResponse({
    required String name,
    required String email,
    required String location,
    required String contact,
    required File image,
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

      String? mimeTypeImage = image.path == "" ? "" : CustomMimeType.getMimeType(image.path);

      Map<String,dynamic> data = {
        "name": name,
        "isCbtHolder": false,
        "contact": contact,
        "location": location
      };

      print(jsonEncode(data));



      dio.FormData formData = dio.FormData.fromMap({
        "data": jsonEncode(data),
        "image": image.path != "" ? await dio.MultipartFile.fromFile(image.path,filename: image.path.split('/').last,contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last)) : "",
      });




      var response = await dio.Dio().put(
        "${AppApiUrl.serverLinkUrl()}users",
        data: formData,
        options: dio.Options(headers: <String, String>{
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer, ${accessToken}'
        }),
      );
      print(jsonEncode(response.data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }

  static Future<void> updatePasswordResponse({
    required String oldPassword,
    required String newPassword,
    required String email,
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

      Map<String,dynamic> data = {
        "email": email,
        "oldPassword": oldPassword,
        "newPassword": newPassword
      };
      print(jsonEncode(data));

      var response = await dio.Dio().post(
        "${AppApiUrl.serverLinkUrl()}auth/change-password",
        data: {
          "email": email,
          "oldPassword": oldPassword,
          "newPassword": newPassword
        },
        options: dio.Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer, ${accessToken}'
        }),
      );
      print(jsonEncode(response.statusCode));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }


  static Future<void> deleteAccountResponse({
    required String userId,
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

      var response = await dio.Dio().delete(
        "${AppApiUrl.serverLinkUrl()}users/${userId}",
        options: dio.Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer, ${accessToken}'
        }),
      );
      print(jsonEncode(response.statusCode));
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data["message"]);
      } else {
        onFail(response.data["message"]);
      }
    } on dio.DioException catch (e) {
      print(e.response?.data);
      onExceptionFail(e.response?.data["message"]);
    }
  }

}