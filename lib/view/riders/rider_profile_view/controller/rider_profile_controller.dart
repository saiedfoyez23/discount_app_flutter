import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/model/rider_profile_response.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../res/res.dart';

class RiderProfileController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<RiderProfileResponse> riderProfileResponse = RiderProfileResponse().obs;
  BuildContext context;
  Rx<TextEditingController> nameControllerText = TextEditingController().obs;
  RiderProfileController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getRiderProfileApiService(context: context);
    });
  }


  Future<void> getRiderProfileApiService({
    required BuildContext context,
  }) async {

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.get(
      url: ApiUtils.riderProfile,
      authorization: accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        riderProfileResponse.value = RiderProfileResponse.fromJson(data);
        nameControllerText.value.text = riderProfileResponse.value.data?.name ?? "";
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );

  }


  Future<void> updateRiderImageNameController({
    required BuildContext context,
    required String riderId,
    required String name,
    required File pickedImage,
  }) async {
    isLoading.value = true;

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    final Map<String, dynamic> jsonData = {
      "name": name,
    };

    print(jsonEncode(jsonData));
    print(pickedImage.path);

    dio.FormData formData = dio.FormData.fromMap({
      if(pickedImage.path != "")
        "image": await dio.MultipartFile.fromFile(
          pickedImage.path,
          filename: pickedImage.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(pickedImage.path).split('/').first,
            MimeTypeUtils.getMimeType(pickedImage.path).split('/').last,
          ),
        ),
      "data": jsonEncode(jsonData),  // important → JSON encoded string!
    });

    await BaseApiUtils.put(
      url: ApiUtils.riderProfileUpdate(riderId),
      formData: formData,
      authorization: accessToken,
      onSuccess: (e,data) async {
        await getRiderProfileApiService(context: context);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }

}