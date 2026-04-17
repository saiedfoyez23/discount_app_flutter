import 'dart:convert';
import 'dart:io';

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
  RxString initialCountryCode = "".obs;
  Rx<GetBrokerProfileResponseModel> getBrokerProfileResponseModel = GetBrokerProfileResponseModel().obs;
  RxBool isLoading = false.obs;
  Rx<File> profileImageFile = File("").obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!)).obs;
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
      return {'countryCode': 'BD', 'nationalNumber': ''}; // Change default if needed
    }

    // Clean the input: keep only digits and +
    String cleaned = fullPhone.replaceAll(RegExp(r'[^0-9+]'), '').trim();

    Country? matchedCountry;
    int maxLength = 0;

    // Search for the longest matching dial code
    for (var country in countries) {
      String dialCode = country.dialCode; // e.g. "+880", "+1", "+44"

      if (cleaned.startsWith(dialCode) && dialCode.length > maxLength) {
        maxLength = dialCode.length;
        matchedCountry = country;
      }
    }

    if (matchedCountry != null) {
      // Extract national number (remove the dial code part)
      String national = cleaned.substring(maxLength);

      return {
        'countryCode': matchedCountry.code,     // e.g. 'BD', 'US', 'GB', 'IN'
        'nationalNumber': national,
      };
    }

    // Fallback if no country matched
    return {
      'countryCode': 'BD',   // or 'US' if you prefer
      'nationalNumber': cleaned.replaceAll('+', ''),
    };
  }


  Future<void> getVendorProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.brokersProfile,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getBrokerProfileResponseModel.value = GetBrokerProfileResponseModel.fromJson(data);
        firstNameController.value.text = getBrokerProfileResponseModel.value.data?.name ?? "";
        emailController.value.text = getBrokerProfileResponseModel.value.data?.email ?? "";
        locationController.value.text = getBrokerProfileResponseModel.value.data?.location ?? "";
        final parsed = parsePhoneNumber(getBrokerProfileResponseModel.value.data?.contact ?? "");
        initialCountryCode.value = parsed['countryCode']!;
        phoneNumberController.value.text = parsed['nationalNumber']!;
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        print(data);
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );
  }




}