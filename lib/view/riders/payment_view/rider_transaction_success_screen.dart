import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/home_view/view/rider_home.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RiderTransactionSuccessScreen extends StatelessWidget {
  const RiderTransactionSuccessScreen({super.key});

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
            opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  HomeResturantAppBar(),

                  40.heightBox,
                  Stack(
                    children: [
                      // Background Image
                      Image.asset(
                        ImageUtils.transactionSucBg, // Your background image
                        fit: BoxFit.fill,
                      ),

                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Success Icon
                              Container(
                                padding: EdgeInsets.all(12),
                                width: 150.w(context),
                                height: 150.h(context),
                                child: Lottie.asset(ImageUtils.successAnim, repeat: false, fit: BoxFit.cover),
                              ),
                              SizedBox(height: 10),

                              // Transaction Status
                              Text(
                                'Transaction Successful',
                                style: GoogleFonts.urbanist(
                                  fontSize: 24.sp(context),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Your top up has been successfully done',
                                style: GoogleFonts.urbanist(
                                    fontSize: 18.sp(context),
                                    color: ColorUtils.blackColor,
                                    fontWeight: FontWeight.w400
                                ),
                              ),

                              SizedBox(height: 20),
                              // Total Pay
                              Text(
                                'Total Pay',
                                style: GoogleFonts.urbanist(
                                    fontSize: 16.sp(context),
                                    color: ColorUtils.blackColor
                                ),
                              ),
                              Text(
                                '\$200.00',
                                style: GoogleFonts.urbanist(
                                  fontSize: 24.sp(context),
                                  fontWeight: FontWeight.w700,
                                  color: ColorUtils.blackColor,
                                ),
                              ),

                              40.heightBox,
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: CustomText(
                                    title: "Total Top Up",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp(context),
                                  )
                              ),

                              // Top Up Card Info
                              10.heightBox,
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    // Card Icon
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade50,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.credit_card,
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(width: 12),

                                    // Card Details
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Standard Chartered Card',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '1234 5678 2345',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),

                              // Close Button
                              Roundbutton(
                                title: "Close",
                                buttonColor: ColorUtils.primaryColor,
                                onTap: () {
                                  Get.to(RiderHome(selectedIndex: 0,));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Content
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

