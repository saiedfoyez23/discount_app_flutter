import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/utils.dart';

class BrokerEditProfileController extends GetxController {

  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  RxString phoneNumber = "".obs;
  RxString initialCountryCode = "BD".obs;
  Rx<GetBrokerProfileResponseModel> getBrokerProfileResponseModel = GetBrokerProfileResponseModel().obs;
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
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),).obs;
  BuildContext context;
  BrokerEditProfileController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorProfileController(context: context);
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


  Future<void> getVendorProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.brokersProfile,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e, data) async {
        isLoading.value = false;
        getBrokerProfileResponseModel.value = GetBrokerProfileResponseModel.fromJson(data);
        final name = getBrokerProfileResponseModel.value.data?.name ?? "";
        if (name.contains(",")) {
          final parts = name.split(",");
          firstNameController.value.text = parts.first;
          lastNameController.value.text =
          parts.length > 1 ? parts.last : "";
        } else {
          firstNameController.value.text = name;
          lastNameController.value.text = "";
        }
        emailController.value.text = getBrokerProfileResponseModel.value.data?.email ?? "";
        locationController.value.text = getBrokerProfileResponseModel.value.data?.location ?? "";
        await parseIncomingPhone(getBrokerProfileResponseModel.value.data?.contact ?? "",
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