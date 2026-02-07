import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:discount_me_app/view/users/home_view/model/categories_response_model.dart';
import 'package:discount_me_app/view/users/home_view/model/single_product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/res.dart';
import '../../../../utils/utils.dart';

class VendorProductEditController extends GetxController {

  BuildContext context;
  String productId;
  VendorProductEditController({required this.context,required this.productId});
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<SingleProductResponseModel> singleProductResponseModel = SingleProductResponseModel().obs;
  Rx<TextEditingController> itemNameController = TextEditingController().obs;
  Rx<TextEditingController> itemDetailsController = TextEditingController().obs;
  Rx<TextEditingController> itemPriceController = TextEditingController().obs;
  Rx<TextEditingController> itemQuantityController = TextEditingController().obs;
  Rx<CategoriesResponseModel> categoriesResponseModel = CategoriesResponseModel().obs;
  RxList<File> coverImages = <File>[].obs;
  RxList<String> coverScreenSorts = <String>[].obs;
  Rx<Categories> singleCategory = Categories().obs;

  Rx<PageController> pageController = PageController(initialPage: 0).obs; // Start at the first page
  RxInt currentPage = 0.obs;
  Timer? _timer;

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  Future<void> startAutoPlay() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage.value < 2) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      if (pageController.value.hasClients) {
        pageController.value.animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 350),
          curve: Curves.linearToEaseOut, // Swapping-like effect
        );
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await getCategoriesController(
        context: context,
        onComplete: () async {
          await getVendorProductDetailsController(
            context: context,
            productId: productId,
          );
        },
      );
    });
  }




  Future<void> getVendorProductDetailsController({
    required BuildContext context,
    required String productId,
  }) async {

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.get(
      url: ApiUtils.productDetails(productId),
      authorization: accessToken,
      onSuccess: (e,data) async {
        print(data);
        isLoading.value = false;
        singleProductResponseModel.value = SingleProductResponseModel.fromJson(data);
        singleProductResponseModel.value.data?.images?.forEach((value) {
          coverScreenSorts.add(value);
          coverScreenSorts.refresh();
        });
        itemNameController.value.text = singleProductResponseModel.value.data?.name ?? "";
        itemDetailsController.value.text = singleProductResponseModel.value.data?.description ?? "";
        itemPriceController.value.text = singleProductResponseModel.value.data?.price.toString() ?? "";
        itemQuantityController.value.text = singleProductResponseModel.value.data?.quantity.toString() ?? "";
        singleCategory.value = categoriesResponseModel.value.categories!.where((value)=>value.sId == singleProductResponseModel.value.data?.category?.sId).first;
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


  Future<void> getCategoriesController({
  required BuildContext context,
    required Function onComplete,
  }) async {
    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.get(
      url: ApiUtils.categoriesResponse,
      authorization: accessToken,
      onSuccess: (e,data) async {
        categoriesResponseModel.value = CategoriesResponseModel.fromJson(data);
        print(categoriesResponseModel.value.categories?.length);
        onComplete();
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
        //await getRiderProfileApiService(context: context);
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