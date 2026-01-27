import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:discount_me_app/view/authenticaion/view/sign_in_screen.dart';
import 'package:discount_me_app/view/users/home_view/model/get_all_product_cart_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/res.dart';
import '../../../../utils/utils.dart';
class OrderSelectAddressController extends GetxController {

  Rx<GetAllProductCartResponse> getAllProductCartResponse = GetAllProductCartResponse().obs;
  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble discount = 0.0.obs;
  RxDouble shippingFee = 0.0.obs;
  RxDouble total = 0.0.obs;

  //Billing Address
  Rx<TextEditingController> billingNameController = TextEditingController().obs;
  Rx<TextEditingController> billingCompanyNameController = TextEditingController().obs;
  Rx<TextEditingController> billingStreetAddressController = TextEditingController().obs;
  Rx<TextEditingController> billingCountryController = TextEditingController().obs;
  Rx<TextEditingController> billingStateController = TextEditingController().obs;
  Rx<TextEditingController> billingCityController = TextEditingController().obs;
  Rx<TextEditingController> billingZipCodeController = TextEditingController().obs;
  Rx<TextEditingController> billingHouseNoController = TextEditingController().obs;
  Rx<TextEditingController> billingEmailController = TextEditingController().obs;
  Rx<TextEditingController> billingPhoneController = TextEditingController().obs;

  //Shipping Address
  Rx<TextEditingController> shippingNameController = TextEditingController().obs;
  Rx<TextEditingController> shippingCompanyNameController = TextEditingController().obs;
  Rx<TextEditingController> shippingStreetAddressController = TextEditingController().obs;
  Rx<TextEditingController> shippingCountryController = TextEditingController().obs;
  Rx<TextEditingController> shippingStateController = TextEditingController().obs;
  Rx<TextEditingController> shippingCityController = TextEditingController().obs;
  Rx<TextEditingController> shippingZipCodeController = TextEditingController().obs;
  Rx<TextEditingController> shippingHouseNoController = TextEditingController().obs;
  Rx<TextEditingController> shippingEmailController = TextEditingController().obs;
  Rx<TextEditingController> shippingPhoneController = TextEditingController().obs;

  BuildContext context;

  RxList<RadioValueClass> paymentType = <RadioValueClass>[
    RadioValueClass(value: "cash",name: "Cash On Delivery"),
    RadioValueClass(value: "stripe",name: "Stripe")
  ].obs;

  Rx<RadioValueClass> selectPaymentType = RadioValueClass(name: '', value: '').obs;

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

  Future<void> createPaymentController({
    required BuildContext context,
  }) async {

    isSubmit.value = true;

    List<Map<String,dynamic>> items = [];

    getAllProductCartResponse.value.data?.carts?.forEach((value) {
      items.add({
        "product": value.product?.sId,
        "store": value.product?.store?.sId,
        "name": value.product?.name,
        "shipping_fee": value.shippingFee,
        "amount": value.product?.price,
        "quantity": value.quantity,
      });
    });

    Map<String,dynamic> data = {
      "payment_status": "unpaid",
      "payment_method": selectPaymentType.value.value,
      "items": items,
      "billing_address": {
        "name": billingNameController.value.text,
        "company_name": billingCompanyNameController.value.text,
        "street_address": billingStreetAddressController.value.text,
        "country": billingCountryController.value.text,
        "state": billingStateController.value.text,
        "city": billingCityController.value.text,
        "zip_code": billingZipCodeController.value.text,
        "house_no": billingHouseNoController.value.text,
        "email": billingEmailController.value.text,
        "phone": billingPhoneController.value.text,
      },
      "shipping_address": {
        "name": shippingNameController.value.text,
        "company_name": shippingCompanyNameController.value.text,
        "street_address": shippingStreetAddressController.value.text,
        "country": shippingCountryController.value.text,
        "state": shippingStateController.value.text,
        "city": shippingCityController.value.text,
        "zip_code": shippingZipCodeController.value.text,
        "house_no": shippingHouseNoController.value.text,
        "email": shippingEmailController.value.text,
        "phone": shippingPhoneController.value.text,
      }
    };
    debugPrint(jsonEncode(data));

    print(data);

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.post(
      url: ApiUtils.createPaymentResponse,
      data: data,
      authorization: accessToken,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
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



  Future<void> createOrderController({
    required BuildContext context,
  }) async {

    isSubmit.value = true;

    List<Map<String,dynamic>> items = [];
    getAllProductCartResponse.value.data?.carts?.forEach((value) {
      items.add({
        "product": value.product?.sId,
        "store": value.product?.store?.sId,
        "name": value.product?.name,
        "shipping_fee": value.shippingFee,
        "amount": value.product?.price,
        "quantity": value.quantity,
      });
    });

    Map<String,dynamic> data = {
      "subtotal": (discount.value + shippingFee.value + total.value),
      "discount": discount.value,
      "shipping_fee": shippingFee.value,
      "total": total.value,
      "payment_status": "unpaid",
      "payment_method": selectPaymentType.value.value,
      "items": items,
      "billing_address": {
        "name": billingNameController.value.text,
        "company_name": billingCompanyNameController.value.text,
        "street_address": billingStreetAddressController.value.text,
        "country": billingCountryController.value.text,
        "state": billingStateController.value.text,
        "city": billingCityController.value.text,
        "zip_code": billingZipCodeController.value.text,
        "house_no": billingHouseNoController.value.text,
        "email": billingEmailController.value.text,
        "phone": billingPhoneController.value.text,
      },
      "shipping_address": {
        "name": shippingNameController.value.text,
        "company_name": shippingCompanyNameController.value.text,
        "street_address": shippingStreetAddressController.value.text,
        "country": shippingCountryController.value.text,
        "state": shippingStateController.value.text,
        "city": shippingCityController.value.text,
        "zip_code": shippingZipCodeController.value.text,
        "house_no": shippingHouseNoController.value.text,
        "email": shippingEmailController.value.text,
        "phone": shippingPhoneController.value.text,
      }
    };
    debugPrint(jsonEncode(data));

    print(data);

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.post(
      url: ApiUtils.createOrderResponse,
      data: data,
      authorization: accessToken,
      onSuccess: (e,data) async {
        MessageSnackBarWidget.successSnackBarWidget(context: context, message: e);
        isSubmit.value = false;
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


class RadioValueClass {
  String? name;
  String? value;

  RadioValueClass({required this.name,required this.value});
}