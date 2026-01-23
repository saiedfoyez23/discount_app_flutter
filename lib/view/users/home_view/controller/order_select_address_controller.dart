import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_in_screen.dart';
import 'package:discount_me_app/view/users/home_view/model/get_all_product_cart_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '';
import '../../../../res/res.dart';
class OrderSelectAddressController extends GetxController {

  Rx<GetAllProductCartResponse> getAllProductCartResponse = GetAllProductCartResponse().obs;
  RxBool isLoading = false.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble discount = 0.0.obs;
  RxDouble shippingFee = 0.0.obs;
  RxDouble total = 0.0.obs;
  BuildContext context;

  OrderSelectAddressController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await addToCartResponse(
        onSuccess: (e) async {
          isLoading.value = false;
          getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(e);
          getAllProductCartResponse.value.data?.carts?.forEach((e){
            total.value = total.value + double.parse(e.subtotal.toString());
            shippingFee.value = shippingFee.value + double.parse(e.shippingFee.toString());
          });
          subTotal.value = total.value + shippingFee.value + discount.value;
        },
        onFail: (e) async {
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
        },
        onExceptionFail: (e) async {
          isLoading.value = false;
          CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          if(e == "jwt expired") {
            await AppLocalStorage.removeKey(key: "Login");
            Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
          }
        },
      );
    });
  }


  static Future<void> addToCartResponse({
    required Function onSuccess,
    required Function onFail,
    required Function onExceptionFail
  }) async {
    try{

      String accessToken = "";
      await AppLocalStorage.getString(key: "Login").then((value) {
        accessToken = jsonDecode(value!)["data"]["accessToken"];
      });
      print(accessToken);


      print("${AppApiUrl.serverLinkUrl()}carts");
      var response = await Dio().get(
        "${AppApiUrl.serverLinkUrl()}carts",
        options: Options(headers: <String, String>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer, ${accessToken}'
        }),
      );
      print(response.data);
      if(response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      }else {
        onFail(response.data["message"]);
      }
    } on DioException catch (e) {
      onExceptionFail(e.response?.data["message"]);
    }

  }



}