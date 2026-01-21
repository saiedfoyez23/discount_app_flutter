import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:discount_me_app/utils/utils.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(ImageUtils.orderCompleteBg),
            alignment: Alignment.topCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie success animation
            Container(
              height: 150.h(context),
              width: 150.w(context),
              child: Lottie.asset(
                ImageUtils.successAnim, // Path to your Lottie animation
                fit: BoxFit.contain,
                repeat: false
              ),
            ),

            SizedBox(height: 20.h(context)),

            // Thank You! Order Completed Text
            Text(
              'Thank You!',
              style: GoogleFonts.urbanist(
                fontSize: 24.sp(context),
                fontWeight: FontWeight.w700,
                color: Colors.green,
                  decoration: TextDecoration.none
              ),
            ),
            Text(
              'Order Completed',
              style: GoogleFonts.urbanist(
                fontSize: 24.sp(context),
                fontWeight: FontWeight.w700,
                color: Colors.green,
                decoration: TextDecoration.none
              ),
            ),
          ],
        ),
      ),
    );
  }
}
