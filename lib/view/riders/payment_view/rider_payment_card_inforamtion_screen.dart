import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/payment_view/rider_transaction_success_screen.dart';
import 'package:discount_me_app/view/users/coupon_view/controller/payment_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/utils/utils.dart';

class RiderPaymentCardInforamtionScreen extends StatelessWidget {
  RiderPaymentCardInforamtionScreen({super.key});
  final PaymentInfoController paymentController = Get.put(PaymentInfoController());

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(ImageUtils.homeBg),
          alignment: Alignment.topRight,
          opacity: 0.5,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // Add the continue button in the bottom navigation bar
        bottomNavigationBar: Container(
          // padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(bottom: 15.h(context), left: 15.w(context), right: 15.w(context)),
          child: SizedBox(
            width: width,
            height: 60.h(context),
            child: Roundbutton(
              buttonColor: ColorUtils.primaryColor,
              padding_vertical: 15.h(context),
              borderRadius: 8,
              title: "Continue", onTap: () {
              Get.to(RiderTransactionSuccessScreen());
            },
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  HomeResturantAppBar(),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h(context)),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Account Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r(context)),
                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h(context)),
                      Obx(() {
                        return TextField(
                          obscureText: paymentController.isCardNumberObscured.value,
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r(context)),
                              borderSide: BorderSide(color: Colors.grey, width: 1.5),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                paymentController.isCardNumberObscured.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                paymentController.toggleCardNumberVisibility(); // Toggles visibility
                              },
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly, // Only allow digits
                            LengthLimitingTextInputFormatter(19), // Max 19 characters (including spaces)
                            CardNumberInputFormatter(), // Custom formatter to auto-space every 4 digits
                          ],
                        );
                      }),
                      SizedBox(height: 16.h(context)),
                      // Exp Date and CVV Row
                      Row(
                        children: [
                          // Exp Date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Exp Date',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r(context)),
                                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                    ),
                                  ),
                                  keyboardType: TextInputType.datetime,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.w(context)),
                          // CVV
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'CVV',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r(context)),
                                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom TextInputFormatter for auto-spacing every 4 digits
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(' ', ''); // Remove any existing spaces
    StringBuffer newText = StringBuffer();

    // Add a space after every 4 digits
    for (int i = 0; i < text.length; i++) {
      if (i % 4 == 0 && i != 0) {
        newText.write(' ');
      }
      newText.write(text[i]);
    }

    // Return the new value with the cursor in the correct position
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
