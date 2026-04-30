import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:discount_me_app/view/vendors/vendor_profile_view/model/vendor_profile_response_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../../res/res.dart';
import 'package:discount_me_app/view/view.dart';


class VendorProfileController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<VendorProfileResponseModel> vendorProfileResponseModel = VendorProfileResponseModel().obs;
  BuildContext context;
  Rx<TextEditingController> nameControllerText = TextEditingController().obs;
  VendorProfileController({required this.context});


  RxInt currentPage = 0.obs;
  Rx<File> imageFile = File("").obs;

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  Rx<PageController> pageController = PageController(initialPage: 0).obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getVendorProfileController(context: context);
    });
  }


  Future<void> getVendorProfileController({
    required BuildContext context,
  }) async {

    LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);


    BaseApiUtils.get(
      url: ApiUtils.vendorsProfile,
      authorization: loginResponseModel.data?.accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        vendorProfileResponseModel.value = VendorProfileResponseModel.fromJson(data);
        nameControllerText.value.text = vendorProfileResponseModel.value.data?.store?.name ?? "";
        imageFile.value = File("");
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

  Future<void> updateCoverPhoto({
    required String vendorId,
    required String storeName,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'svg'],
    );
    if (result != null) {
      // The user has selected a file
      PlatformFile file = result.files.first;
      // Do something with the file (e.g., upload it)
      print('File selected: ${file.name}');
      imageFile.value = File(file.path!);
      await updateVendorImageNameController(
        context: context,
        vendorId: vendorId,
        storeName: storeName,
        pickedImage: File(file.path!),
      );
    } else {
      CustomSnackBar().normalCustomSnackBar(context: context, message: "No file selected");
    }
  }


  Future<void> updateVendorImageNameController({
    required BuildContext context,
    required String vendorId,
    required String storeName,
    required File pickedImage,
  }) async {
    isLoading.value = true;

    LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.loginResponse)!),);

    final Map<String, dynamic> jsonData = {
      "store_name": storeName,
    };

    print(jsonEncode(jsonData));
    print(pickedImage.path);

    dio.FormData formData = dio.FormData.fromMap({
      if(pickedImage.path != "")
        "images": await dio.MultipartFile.fromFile(
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
      url: ApiUtils.vendorProfileUpdate(vendorId),
      formData: formData,
      authorization: loginResponseModel.data?.accessToken,
      onSuccess: (e,data) async {
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


}