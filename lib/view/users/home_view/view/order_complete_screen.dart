// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:lottie/lottie.dart';


class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.orderCompleteBg),
            alignment: Alignment.topCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie success animation
            Container(
              height: 150.h,
              width: 150.w,
              child: Lottie.asset(
                AppImages.successAnim, // Path to your Lottie animation
                fit: BoxFit.contain,
                repeat: false
              ),
            ),

            SizedBox(height: 20.h),

            // Thank You! Order Completed Text
            Text(
              'Thank You!',
              style: GoogleFonts.urbanist(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.green,
                  decoration: TextDecoration.none
              ),
            ),
            Text(
              'Order Completed',
              style: GoogleFonts.urbanist(
                fontSize: 24.sp,
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
