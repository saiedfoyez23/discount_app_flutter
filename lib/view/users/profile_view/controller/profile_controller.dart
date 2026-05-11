import 'dart:convert';

import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';


class ProfileController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  BuildContext context;
  Rx<TextEditingController> nameControllerText = TextEditingController().obs;
  ProfileController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getUserProfileApiService(context: context);
    });
  }



  Future<void> getUserProfileApiService({
    required BuildContext context,
  }) async {
    await BaseApiUtils.get(
      url: ApiUtils.getUserProfileResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        userProfileResponseModel.value = UserProfileResponseModel.fromJson(data);
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


  Future<void> brokerUpdateAccountController({
    required BuildContext context,
    required Map<String,dynamic> data,
    required String brokerId,
    File? profileImageFile,
    File? documentImageFile,
  }) async {

    dio.FormData formData = dio.FormData.fromMap({
      if(profileImageFile != null && profileImageFile.path != "")
        "image": await dio.MultipartFile.fromFile(
          profileImageFile.path,
          filename: profileImageFile.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(profileImageFile.path).split('/').first,
            MimeTypeUtils.getMimeType(profileImageFile.path).split('/').last,
          ),
        ),
      if(documentImageFile != null && documentImageFile.path != "")
        "document": await dio.MultipartFile.fromFile(
          documentImageFile.path,
          filename: documentImageFile.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(documentImageFile.path).split('/').first,
            MimeTypeUtils.getMimeType(documentImageFile.path).split('/').last,
          ),
        ),
      "data": jsonEncode(data),  // important → JSON encoded string!
    });


    await BaseApiUtils.put(
      url: ApiUtils.editBrokerProfile(brokerId),
      formData: formData,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await getVendorProfileController(context: context);
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
      },
    );
  }



}