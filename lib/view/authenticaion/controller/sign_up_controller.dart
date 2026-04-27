import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_intl_phone_field/countries.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../res/res.dart';

class SignUpController extends GetxController {


  Future<void> determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat.value = position.latitude.toString();
    long.value = position.longitude.toString();
    locationController.value.text = "${lat.value},${long.value}";
  }



  Future<void> checkLocationPermission() async {
    Future.delayed(const Duration(milliseconds: 500),() async {
      LocationPermission permission;
      var checkPermission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      print(permission);
      if(permission == LocationPermission.denied){
        await checkLocationPermission();
      }else {
        await determinePosition();
      }
    });
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(milliseconds: 100),() async {
      await resetFunction();
    });
  }

  Rx<File> imageFile = File("").obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> restaurantNameController = TextEditingController().obs;
  Rx<TextEditingController> restaurantDescriptionController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> locationController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<String> lat = "".obs;
  Rx<String> long = "".obs;
  Rx<File> documentFile = File("").obs;
  Rx<File> drivingLicenceFile = File("").obs;
  Rx<File> coverFile = File("").obs;
  Rx<File> taxFile = File("").obs;
  RxString selectedRole = "User".obs;
  RxBool isSubmit = false.obs;
  RxList<String> positions = [
    'Federal Government Official',
    'State Government Official',
    'City Council Member',
    'Mayor',
    'Senator',
    'Congressperson',
    'Police Officer',
    'Firefighter',
    'Public School Teacher',
    'Healthcare Worker',
    'Other'
  ].obs;
  RxString selectedPosition = "".obs;

  Future<void> changeRole(String value) async {
    selectedRole.value = value;
  }

  RxBool isPasswordVisible = true.obs;   // For first password field
  RxBool isConfirmPasswordVisible = true.obs; // For confirm password field

  Future<void> togglePasswordVisibility() async {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> toggleConfirmPasswordVisibility() async {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }


  Future<void> resetFunction() async {
    imageFile = File("").obs;
    firstNameController = TextEditingController().obs;
    lastNameController = TextEditingController().obs;
    restaurantNameController = TextEditingController().obs;
    restaurantDescriptionController = TextEditingController().obs;
    emailController = TextEditingController().obs;
    locationController = TextEditingController().obs;
    phoneNumberController = TextEditingController().obs;
    selectedPosition = "".obs;
    passwordController = TextEditingController().obs;
    confirmPasswordController = TextEditingController().obs;
    documentFile = File("").obs;
    phoneNumber.value = "";
    initialCountryCode.value = "BD";
    drivingLicenceFile = File("").obs;
    coverFile = File("").obs;
    taxFile = File("").obs;
    isPasswordVisible = true.obs;
    isConfirmPasswordVisible = true.obs;
    isSubmit = false.obs;
    matchedCountry.value = Country(
      name: '',
      flag: '',
      code: '',
      dialCode: '',
      nameTranslations: {},
      maxLength: 0,
      minLength: 0,
    );
  }


  RxString phoneNumber = "".obs;
  RxString initialCountryCode = "BD".obs;

  Rx<Country> matchedCountry = Country(
    name: '',
    flag: '',
    code: '',
    dialCode: '',
    nameTranslations: {},
    maxLength: 0,
    minLength: 0,
  ).obs;


  Future<void> pickProfileImage({
    required ImageSource source,
    required BuildContext context,
  }) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      imageFile.value = File(pickedFile.path);
    }
  }


  Future<void> pickCoverImage({
    required ImageSource source,
    required BuildContext context,
  }) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      coverFile.value = File(pickedFile.path);
    }
  }


  Future<void> getUserSignUpResponse({
    File? image,
    File? document,
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
      String? mimeTypeDocument = document?.path == "" ? "" : CustomMimeType.getMimeType(document!.path);
      print(mimeTypeImage);
      print(mimeTypeDocument);

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
        "document": document?.path != "" ? await dio.MultipartFile.fromFile(document!.path,filename: document.path.split('/').last,contentType: dio.DioMediaType(mimeTypeDocument.split("/").first,mimeTypeDocument.split("/").last)) : "",
      });




      var response = await dio.Dio().post(
        "${AppApiUrl.serverLinkUrl()}auth/user-sign-up",
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


  Future<void> getRiderSignUpResponse({
    File? image,
    File? document,
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
      String? mimeTypeDocument = document?.path == "" ? "" : CustomMimeType.getMimeType(document!.path);
      print(mimeTypeImage);
      print(mimeTypeDocument);

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
        "document": document?.path != "" ? await dio.MultipartFile.fromFile(document!.path,filename: document.path.split('/').last,contentType: dio.DioMediaType(mimeTypeDocument.split("/").first,mimeTypeDocument.split("/").last)) : "",
      });




      var response = await dio.Dio().post(
        "${AppApiUrl.serverLinkUrl()}auth/rider-sign-up",
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

  Future<void> getVendorSignUpResponse({
    File? coverImage,
    File? taxFile,
    required String restaurantName,
    required String restaurantDescription,
    required String email,
    required String password,
    required String location,
    required String contact,
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try {

      String? mimeTypeImage = coverImage?.path == "" ? "" : CustomMimeType.getMimeType(coverImage!.path);
      String? mimeTypeDocument = taxFile?.path == "" ? "" : CustomMimeType.getMimeType(taxFile!.path);
      print(mimeTypeImage);
      print(mimeTypeDocument);

      Map<String,dynamic> data = {
        "email": email,
        "password": password,
        "store_name": restaurantName,
        "store_description": restaurantDescription,
        "contact": contact,
        "location": {
          "coordinates": [
            double.parse(long.value),
            double.parse(lat.value)
          ]
        }
      };

      print(jsonEncode(data));


      dio.FormData formData = dio.FormData.fromMap({
        "images": coverImage?.path != "" ? await dio.MultipartFile.fromFile(coverImage!.path,filename: coverImage.path.split('/').last,contentType: dio.DioMediaType(mimeTypeImage.split('/').first,mimeTypeImage.split('/').last)) : "",
        "data": jsonEncode(data),
        "document": taxFile?.path != "" ? await dio.MultipartFile.fromFile(taxFile!.path,filename: taxFile.path.split('/').last,contentType: dio.DioMediaType(mimeTypeDocument.split("/").first,mimeTypeDocument.split("/").last)) : "",
      });




      var response = await dio.Dio().post(
        "${AppApiUrl.serverLinkUrl()}auth/vendor-sign-up",
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