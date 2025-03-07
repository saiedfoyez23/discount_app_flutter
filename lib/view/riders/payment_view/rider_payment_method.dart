// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/payment_view/rider_payment_card_inforamtion_screen.dart';
import 'package:discount_me_app/view/users/coupon_view/controller/peyment_method_controller.dart';

class RiderPaymentMethodScreen extends StatelessWidget {
  RiderPaymentMethodScreen({super.key});

  final PaymentMethodController controller = Get.put(PaymentMethodController());

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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightBox,
                      HomeResturantAppBar(),
                      20.heightBox,
                      RadioTheme(
                        data: RadioThemeData(
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                                (states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.green; // Selected color
                              }
                              return Colors.grey; // Unselected color
                            },
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Credit Card Option
                            Obx(() => RadioListTile<PaymentMethod>(
                              value: PaymentMethod.creditCard,
                              groupValue: controller.selectedMethod.value,
                              onChanged: (PaymentMethod? value) {
                                if (value != null) {
                                  controller.selectMethod(value);
                                }
                              },
                              activeColor: Colors.green,
                              title: Text(
                                'Credit Card',
                                style: GoogleFonts.urbanist(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                '1234 **** **** 1234',
                                style: GoogleFonts.urbanist(
                                  fontSize: 14.sp,
                                  color: AppColors.whiteDarkActive,
                                ),
                              ),
                            )),
                            // PayPal Option
                            Obx(() => RadioListTile<PaymentMethod>(
                              value: PaymentMethod.paypal,
                              groupValue: controller.selectedMethod.value,
                              onChanged: (PaymentMethod? value) {
                                if (value != null) {
                                  controller.selectMethod(value);
                                }
                              },
                              activeColor: Colors.green,
                              title: Text(
                                'Paypal',
                                style: GoogleFonts.urbanist(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'email@website.com',
                                style: GoogleFonts.urbanist(
                                  fontSize: 14.sp,
                                  color: AppColors.whiteDarkActive,
                                ),
                              ),
                            )),
                            // Apple Pay Option
                            Obx(() => RadioListTile<PaymentMethod>(
                              value: PaymentMethod.applePay,
                              groupValue: controller.selectedMethod.value,
                              onChanged: (PaymentMethod? value) {
                                if (value != null) {
                                  controller.selectMethod(value);
                                }
                              },
                              activeColor: Colors.green,
                              title: Text(
                                'Apple Pay',
                                style: GoogleFonts.urbanist(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'email@website.com',
                                style: GoogleFonts.urbanist(
                                  fontSize: 14.sp,
                                  color: AppColors.whiteDarkActive,
                                ),
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Roundbutton(
                  buttonColor: AppColors.primaryColor,
                  padding_vertical: 15,
                  borderRadius: 8,
                  title: "Continue",
                  onTap: () {
                    Get.to(RiderPaymentCardInforamtionScreen());
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

