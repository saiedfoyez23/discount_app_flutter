import 'package:discount_me_app/view/users/home_view/controller/order_select_address_controller.dart';
import 'package:discount_me_app/view/users/home_view/view/order_screen.dart';
import 'package:discount_me_app/view/users/home_view/widget/order_select_address_widget/order_billing_address_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/order_select_address_widget/order_shipping_address_widget.dart';
import 'package:discount_me_app/view/users/profile_view/widget/user_profile_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../res/res.dart';

class OrderSelectAddressView extends StatelessWidget {
  OrderSelectAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderSelectAddressController orderSelectAddressController = Get.put(OrderSelectAddressController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>OrderScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(ImageUtils.homeBg),
              alignment: Alignment.topRight,
              opacity: 0.5,
            ),
          ),
          child: Obx(()=>Skeletonizer(
            effect: PulseEffect(),
            enabled: orderSelectAddressController.isLoading.value,
            child: CustomScrollView(
              slivers: [


                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                    child: Column(
                      children: [

                        CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                        UserProfileAppbarWidget(
                          title: "Order Billing Address",
                          onTap: () {
                            Get.off(()=>OrderScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                          },
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 50.h(context)),

                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                          plainTextString: "Payment Type",
                          plainTextStringFontSize: 20.sp(context),
                          plainTextStringFontWeight: FontWeight.w600,
                          plainTextContainerAlignment: Alignment.centerLeft,
                          plainTextStringColor: ColorUtils.black29,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 8.h(context)),

                        Column(
                          children: orderSelectAddressController.paymentType.map((option) {
                            return RadioListTileHelperWidget<RadioValueClass>(
                              title: option.name!,
                              value: option,
                              groupValue: orderSelectAddressController.selectPaymentType.value,
                              onChanged: (value) {
                                orderSelectAddressController.selectPaymentType.value = value!;
                              },
                              activeColor: Color.fromRGBO(0, 176, 71, 1),
                              dense: true,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              contentPadding: EdgeInsets.zero,
                            );
                          }).toList(),
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                        OrderBillingAddressWidget().orderBillingAddressWidget(
                          context: context,
                          orderSelectAddressController: orderSelectAddressController,
                        ),

                        CustomSpaceWidget.spacerWidget(spaceHeight: 50.h(context)),


                        OrderShippingAddressWidget().orderShippingAddressWidget(
                          context: context,
                          orderSelectAddressController: orderSelectAddressController,
                        ),


                        CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                        orderSelectAddressController.isSubmit.value == true ?
                        Container(
                          height: 64.h(context),
                          width: 428.h(context),
                          decoration: const BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(color: ColorUtils.white253,),
                          ),
                        ) :
                        CustomButtonContainer.plainButtonContainer(
                          plainButtonHeight: 64.h(context),
                          plainButtonWidth: 428.w(context),
                          plainButtonRadius: 8.r(context),
                          plainButtonOnPress:  () async {
                            if(orderSelectAddressController.selectPaymentType.value.name == null) {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please select payment option");
                            } else if(orderSelectAddressController.billingNameController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter your billing name");
                            } else if(orderSelectAddressController.billingCompanyNameController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter company name");
                            } else if(orderSelectAddressController.billingStreetAddressController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter address");
                            } else if(orderSelectAddressController.billingCountryController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter country");
                            } else if(orderSelectAddressController.billingStateController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter state");
                            } else if(orderSelectAddressController.billingCityController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter city");
                            } else if(orderSelectAddressController.billingZipCodeController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter zip code");
                            } else if(orderSelectAddressController.billingHouseNoController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter house no");
                            } else if(orderSelectAddressController.billingEmailController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter email");
                            } else if(orderSelectAddressController.billingPhoneController.value.text == "") {
                              CustomSnackBar().errorCustomSnackBar(context: context, message: "Please enter phone");
                            } else {

                              List<Map<String,dynamic>> items = [];
                              orderSelectAddressController.getAllProductCartResponse.value.data?.carts?.forEach((value) {
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
                                "payment_method": orderSelectAddressController.selectPaymentType.value.value,
                                "items": items,
                                "billing_address": {
                                  "name": orderSelectAddressController.billingNameController.value.text,
                                  "company_name": orderSelectAddressController.billingCompanyNameController.value.text,
                                  "street_address": orderSelectAddressController.billingStreetAddressController.value.text,
                                  "country": orderSelectAddressController.billingCountryController.value.text,
                                  "state": orderSelectAddressController.billingStateController.value.text,
                                  "city": orderSelectAddressController.billingCityController.value.text,
                                  "zip_code": orderSelectAddressController.billingZipCodeController.value.text,
                                  "house_no": orderSelectAddressController.billingHouseNoController.value.text,
                                  "email": orderSelectAddressController.billingEmailController.value.text,
                                  "phone": orderSelectAddressController.billingPhoneController.value.text,
                                },
                                "shipping_address": {
                                  "name": orderSelectAddressController.shippingNameController.value.text,
                                  "company_name": orderSelectAddressController.shippingCompanyNameController.value.text,
                                  "street_address": orderSelectAddressController.shippingStreetAddressController.value.text,
                                  "country": orderSelectAddressController.shippingCountryController.value.text,
                                  "state": orderSelectAddressController.shippingStateController.value.text,
                                  "city": orderSelectAddressController.shippingCityController.value.text,
                                  "zip_code": orderSelectAddressController.shippingZipCodeController.value.text,
                                  "house_no": orderSelectAddressController.shippingHouseNoController.value.text,
                                  "email": orderSelectAddressController.shippingEmailController.value.text,
                                  "phone": orderSelectAddressController.shippingPhoneController.value.text,
                                }
                              };
                              print(data);
                            }
                          },
                          plainButtonHint: "Complete Order",
                          plainButtonHintFontSize: 22.sp(context),
                          plainButtonColor: ColorUtils.green176,
                          plainButtonHintFontColor: ColorUtils.white255,
                        ),




                      ],
                    ),
                  ),
                )




              ],
            ),
          )),
        ),
      ),
    );
  }
}
