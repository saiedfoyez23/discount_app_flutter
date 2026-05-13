import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../res/res.dart';
import '../../../../utils/utils.dart';


class UserProfileEditController extends GetxController {


  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  RxString phoneNumber = "".obs;
  RxString initialCountryCode = "BD".obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<File> profileImageFile = File("").obs;
  Rx<Country> matchedCountry = Country(
    name: '',
    flag: '',
    code: '',
    dialCode: '',
    nameTranslations: {},
    maxLength: 0,
    minLength: 0,
  ).obs;
  BuildContext context;
  UserProfileEditController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getUserProfileApiService(context: context);
    });
  }

  Future<void> pickProfileImage({
    required ImageSource source,
  }) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      profileImageFile.value = File(pickedFile.path);
    }
  }



  Map<String, String> parsePhoneNumber(String fullPhone) {
    if (fullPhone.trim().isEmpty) {
      return {'countryCode': 'BD', 'nationalNumber': ''};
    }

    String cleaned = fullPhone.replaceAll(RegExp(r'[^0-9+]'), '');

    String nationalNumber = cleaned;
    Country? foundCountry;

    for (var country in countries) {
      String dialCode = country.dialCode.replaceFirst('', '+');
      if (cleaned.startsWith(dialCode)) {
        foundCountry = country;
        nationalNumber = cleaned.substring(dialCode.length);
        break;
      }
    }

    matchedCountry.value = foundCountry ??
        Country(
          name: '',
          flag: '',
          code: initialCountryCode.value,
          dialCode: '',
          nameTranslations: {},
          maxLength: 0,
          minLength: 0,
        );

    return {
      'countryCode': matchedCountry.value.code,
      'nationalNumber': nationalNumber,
    };
  }


  Future<void> parseIncomingPhone(String? fullPhone) async {
    phoneNumber.value = "";
    phoneNumberController.value = TextEditingController();
    if (fullPhone == null || fullPhone.isEmpty) {
      initialCountryCode.value = "BD";
      return;
    }
    final result = parsePhoneNumber(fullPhone);
    initialCountryCode.value = result['countryCode']!;
    phoneNumberController.value.text = result['nationalNumber']!;
  }


  Future<void> getUserProfileApiService({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.getUserProfileResponse,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e, data) async {
        isLoading.value = false;
        userProfileResponseModel.value = UserProfileResponseModel.fromJson(data);
        final name = userProfileResponseModel.value.data?.name ?? "";
        if (name.contains(",")) {
          final parts = name.split(",");
          firstNameController.value.text = parts.first;
          lastNameController.value.text =
          parts.length > 1 ? parts.last : "";
        } else {
          firstNameController.value.text = name;
          lastNameController.value.text = "";
        }
        emailController.value.text = userProfileResponseModel.value.data?.email ?? "";
        locationController.value.text = userProfileResponseModel.value.data?.location ?? "";
        await parseIncomingPhone(userProfileResponseModel.value.data?.contact ?? "",
        );
      },
      onFail: (e, data) {
        isLoading.value = false;
      },
      onExceptionFail: (e, data) {
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


  static Future<void> getUserNameUpdateResponse({
    required String name,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

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
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
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

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

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
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
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

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

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
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
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

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

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
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
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

      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

      var response = await dio.Dio().delete(
        "${AppApiUrl.serverLinkUrl()}users/${userId}",
        options: dio.Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${loginResponseModel.data?.accessToken}'
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