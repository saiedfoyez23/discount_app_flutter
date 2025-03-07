// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/vendors/vendor_subscription_view/view/vendor_card_information_screen.dart';

class VendorPaymentMethodScreen extends StatefulWidget {
  const VendorPaymentMethodScreen({super.key});

  @override
  State<VendorPaymentMethodScreen> createState() => _VendorPaymentMethodScreenState();
}

class _VendorPaymentMethodScreenState extends State<VendorPaymentMethodScreen> {
  PaymentMethod _selectedMethod = PaymentMethod.creditCard;


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
                      SizedBox(height: 10),
                      HomeResturantAppBar(),
                      SizedBox(height: 20),
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
                            RadioListTile<PaymentMethod>(
                              value: PaymentMethod.creditCard,
                              groupValue: _selectedMethod,
                              onChanged: (PaymentMethod? value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedMethod = value;
                                  });
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
                            ),
                            // PayPal Option
                            RadioListTile<PaymentMethod>(
                              value: PaymentMethod.paypal,
                              groupValue: _selectedMethod,
                              onChanged: (PaymentMethod? value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedMethod = value;
                                  });
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
                            ),
                            // Apple Pay Option
                            RadioListTile<PaymentMethod>(
                              value: PaymentMethod.applePay,
                              groupValue: _selectedMethod,
                              onChanged: (PaymentMethod? value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedMethod = value;
                                  });
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
                            ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VendorCardInformationScreen()),
                    );
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


enum PaymentMethod { creditCard, paypal, applePay }