import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import '';
class BrokerProfileHomeController extends GetxController {

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<GetBrokerProfileResponseModel> getBrokerProfileResponseModel = GetBrokerProfileResponseModel().obs;
  RxBool isLoading = false.obs;
  Rx<LoginResponseModel> loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!)).obs;
  BuildContext context;
  BrokerProfileHomeController({required this.context});


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorProfileController(context: context);
    });
  }

  Rx<File> profileImageFile = File("").obs;

  String formatBrokerName(String? name) {
    if (name == null || name.isEmpty) return "";
    return name.contains(',') ?
    name.replaceFirst(',', '\t').replaceAllMapped(RegExp(r'\t\s+'), (match) => '\t') :
    name;
  }

  Future<void> pickProfileImage({
    required ImageSource source,
    required BuildContext context,
    required Map<String,dynamic> data,
    required String brokerId,
  }) async {
    ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      Navigator.pop(context); // close dialog after selection
      isLoading.value = true;
      profileImageFile.value = File(pickedFile.path);
      await brokerUpdateAccountController(
        context: context,
        data: data,
        brokerId: brokerId,
        profileImageFile: profileImageFile.value,
      );
    }
  }


  Future<void> brokerUpdateAccountController({
    required BuildContext context,
    required Map<String,dynamic> data,
    required String brokerId,
    File? profileImageFile,
    File? documentImageFile,
  }) async {

    dio.FormData formData = dio.FormData.fromMap({
      if(profileImageFile != null)
        "image": await dio.MultipartFile.fromFile(
          profileImageFile.path,
          filename: profileImageFile.path.split('/').last,
          contentType: dio.DioMediaType(
            MimeTypeUtils.getMimeType(profileImageFile.path).split('/').first,
            MimeTypeUtils.getMimeType(profileImageFile.path).split('/').last,
          ),
        ),
      if(documentImageFile != null)
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
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        await getVendorProfileController(context: context);
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




  Future<void> getVendorProfileController({
    required BuildContext context,
  }) async {
    BaseApiUtils.get(
      url: ApiUtils.brokersProfile,
      authorization: loginResponseModel.value.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        getBrokerProfileResponseModel.value = GetBrokerProfileResponseModel.fromJson(data);
        firstNameController.value.text = getBrokerProfileResponseModel.value.data?.name == null ? "" :
        getBrokerProfileResponseModel.value.data?.name.toString().split(",").isNotEmpty == true ?
        getBrokerProfileResponseModel.value.data!.name.toString().split(",").first :
        getBrokerProfileResponseModel.value.data!.name.toString();
        lastNameController.value.text = getBrokerProfileResponseModel.value.data?.name == null ?
        "" :
        getBrokerProfileResponseModel.value.data?.name.toString().split(",").isNotEmpty == true ?
        getBrokerProfileResponseModel.value.data!.name.toString().split(",").last :
        "";
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