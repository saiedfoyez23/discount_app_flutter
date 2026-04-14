import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../res/res.dart';

class BrokerSignUpController extends GetxController {

  Rx<File> imageFile = File("").obs;
  RxBool isSubmit = false.obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxString contact = "".obs;


  RxBool isPasswordVisible = false.obs;   // For first password field
  RxBool isConfirmPasswordVisible = false.obs; // For confirm password field
  RxString selectedRole = "Broker".obs;

  Future<void> togglePasswordVisibility() async {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> toggleConfirmPasswordVisibility() async {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> changeRole(String value) async {
    selectedRole.value = value;
  }


  Future<void> getBrokerSignUpResponse({
    File? image,
    required String name,
    required String password,
    required String email,
    required String location,
    required String contact,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {

      String? mimeTypeImage = image?.path == "" ? "" : CustomMimeType.getMimeType(image!.path);
      print(mimeTypeImage);

      Map<String,dynamic> data = {
        "name": name,
        "password": password,
        "email": email,
        "location": location,
        "contact": contact,
      };

      print(jsonEncode(data));

      dio.FormData formData = dio.FormData.fromMap({
        "image": image?.path != "" ? await dio.MultipartFile.fromFile(image!.path,filename: image.path.split('/').last,contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last)) : "",
        "data": jsonEncode(data),
      });




      var response = await dio.Dio().post(
        "${AppApiUrl.serverLinkUrl()}auth/broker-sign-up",
        data: formData,
        options: dio.Options(headers: <String, String>{
          'Content-Type': 'multipart/form-data',
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


}