import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:image_picker/image_picker.dart';


class ProfileController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  BuildContext context;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
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


  Rx<File> profileImageFile = File("").obs;

  String formatBrokerName(String? name) {
    if (name == null || name.isEmpty) return "";
    return name.contains(',') ?
    name.replaceFirst(',', '\t').replaceAllMapped(RegExp(r'\t\s+'), (match) => '\t') :
    name;
  }

  Future<void> userPickProfileImage({
    required ImageSource source,
    required BuildContext context,
    required Map<String,dynamic> data,
  }) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      isLoading.value = true;
      profileImageFile.value = File(pickedFile.path);
      await userUpdateAccountController(
        context: context,
        data: data,
        profileImageFile: profileImageFile.value,
      );
    }
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
        firstNameController.value.text =  userProfileResponseModel.value.data?.name == null ? "" :
        userProfileResponseModel.value.data?.name.toString().split(",").isNotEmpty == true ?
        userProfileResponseModel.value.data!.name.toString().split(",").first :
        userProfileResponseModel.value.data!.name.toString();
        lastNameController.value.text = userProfileResponseModel.value.data?.name == null ?
        "" :
        userProfileResponseModel.value.data?.name.toString().split(",").isNotEmpty == true ?
        userProfileResponseModel.value.data!.name.toString().split(",").last :
        "";
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


  Future<void> userUpdateAccountController({
    required BuildContext context,
    required Map<String,dynamic> data,
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
      url: ApiUtils.editUserProfile,
      formData: formData,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = true;
        isSubmit.value = false;
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await getUserProfileApiService(context: context);
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


  // static Future<void> getUserUpdateResponse({
  //   required String name,
  //   required String email,
  //   required String location,
  //   required String contact,
  //   required File image,
  //   required Function onSuccess,
  //   required Function onFail,
  //   required Function onExceptionFail
  // }) async {
  //   try {
  //
  //     LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);
  //
  //     String? mimeTypeImage = image.path == "" ? "" : CustomMimeType.getMimeType(image.path);
  //
  //     Map<String,dynamic> data = {
  //       "name": name,
  //       "isCbtHolder": false,
  //       "contact": contact,
  //       "location": location
  //     };
  //
  //     print(jsonEncode(data));
  //
  //
  //
  //     dio.FormData formData = dio.FormData.fromMap({
  //       "data": jsonEncode(data),
  //       "image": image.path != "" ? await dio.MultipartFile.fromFile(image.path,filename: image.path.split('/').last,contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last)) : "",
  //     });
  //
  //
  //
  //
  //     var response = await dio.Dio().put(
  //       "${AppApiUrl.serverLinkUrl()}users",
  //       data: formData,
  //       options: dio.Options(headers: <String, String>{
  //         'Content-Type': 'multipart/form-data',
  //         'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
  //       }),
  //     );
  //     print(jsonEncode(response.data));
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       onSuccess(response.data["message"]);
  //     } else {
  //       onFail(response.data["message"]);
  //     }
  //   } on dio.DioException catch (e) {
  //     print(e.response?.data);
  //     onExceptionFail(e.response?.data["message"]);
  //   }
  // }



}