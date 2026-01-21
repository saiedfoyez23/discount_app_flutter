import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/riders/payment_view/rider_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionHomeScreen extends StatelessWidget {
  const SubscriptionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          title: "Subscription",
          color: ColorUtils.blackColor,
          fontSize: 24.sp(context),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(RiderPaymentMethodScreen());
                },
                child: Stack(
                  children: [
                    Image.asset(
                      ImageUtils.couponBg,
                      scale: 4,
                    ),
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Price Section
                          Padding(
                            padding: EdgeInsets.only(left: 40.w(context)), // Responsive padding using ScreenUtil
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.green,
                                    fontSize: 24.sp(context),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '\$19.99/m',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.orange,
                                    fontSize: 24.sp(context),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Discount Info Section
                          Padding(
                            padding: EdgeInsets.only(right: 40.w(context)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'A Month',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.black,
                                    fontSize: 20.sp(context), // Responsive font size using ScreenUtil
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                5.heightBox,
                                Text(
                                  'with 5% off each payment',
                                  style: GoogleFonts.urbanist(
                                    color: ColorUtils.whiteNormalActive,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
