// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_card_number_input_formatter_widget.dart';
import 'package:discount_me_app/view/riders/payment_view/rider_transaction_success_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_subscription_view/view/vendor_transaction_success_screen.dart';

class VendorCardInformationScreen extends StatefulWidget {
  const VendorCardInformationScreen({super.key});

  @override
  State<VendorCardInformationScreen> createState() => _VendorCardInformationScreenState();
}

class _VendorCardInformationScreenState extends State<VendorCardInformationScreen> {
  bool _isCardNumberObscured = true;

  // Toggles card number visibility
  void _toggleCardNumberVisibility() {
    setState(() {
      _isCardNumberObscured = !_isCardNumberObscured;
    });
  }

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
          margin: EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w),
          child: SizedBox(
            width: width,
            height: 60.h,
            child: Roundbutton(
              buttonColor: AppColors.primaryColor,
              padding_vertical: 15.h,
              borderRadius: 8,
              title: "Continue",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VendorTransactionSuccessScreen()),
                );
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
                  SizedBox(height: 10),
                  HomeResturantAppBar(),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      // Account Name Input
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

                      // Card Number Input
                      TextField(
                        obscureText: _isCardNumberObscured,
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isCardNumberObscured ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: _toggleCardNumberVisibility,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Only allow digits
                          LengthLimitingTextInputFormatter(19), // Max 19 characters (including spaces)
                          CustomCardNumberInputFormatterWidget(),
                        ],
                      ),
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
