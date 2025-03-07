// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_card_number_input_formatter_widget.dart';
import 'package:discount_me_app/view/users/coupon_view/controller/payment_info_controller.dart';
import 'package:discount_me_app/view/users/coupon_view/view/transaction_success_screen.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_resturant_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentInformationScreen extends StatelessWidget {
  PaymentInformationScreen({super.key});
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
          image: AssetImage(AppImages.homeBg),
          alignment: Alignment.topRight,
          opacity: 0.5,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // Add the continue button in the bottom navigation bar
        bottomNavigationBar: Container(
          // padding: EdgeInsets.all(15.w),
          margin: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
          child: SizedBox(
            width: width,
            height: 60.h,
            child: Roundbutton(
              buttonColor: AppColors.primaryColor,
              padding_vertical: 15.h,
              borderRadius: 8,
              title: "Continue", onTap: () {
                Get.to(TransactionSuccessScreen());
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
                      SizedBox(height: 8.h),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Account Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Obx(() {
                        return TextField(
                          obscureText: paymentController.isCardNumberObscured.value,
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
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
                            CustomCardNumberInputFormatterWidget(), // Custom formatter to auto-space every 4 digits
                          ],
                        );
                      }),
                      SizedBox(height: 16.h),
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
                                      borderRadius: BorderRadius.circular(8.r),
                                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                    ),
                                  ),
                                  keyboardType: TextInputType.datetime,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16.w),
                          // CVV
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'CVV',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
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
