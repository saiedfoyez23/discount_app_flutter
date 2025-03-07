// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/view/vendors/vendor_earning_view/view/vendor_withdraw_success_screen.dart';

class VendorPaymentWithdrawScreen extends StatefulWidget {
  const VendorPaymentWithdrawScreen({super.key});

  @override
  State<VendorPaymentWithdrawScreen> createState() => _VendorPaymentWithdrawScreenState();
}

class _VendorPaymentWithdrawScreenState extends State<VendorPaymentWithdrawScreen> {
// List of countries
  final List<String> countries = [
    'United States',
    'Canada',
    'India',
    'Australia',
    'Germany',
    'United Kingdom',
    'France',
    'Japan',
    'China',
    'Brazil',
    'Mexico',
  ];

  // Selected country variable
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Profile",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: width,
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: AppColors.greenLightHover,
                      image: DecorationImage(
                          image: AssetImage(AppImages.walletBg),
                          alignment: Alignment.centerRight),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          AppImages.walletBg2,
                          fit: BoxFit.fill,
                          width: width,
                        ),
                        Positioned.fill(
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                      title: "Your Balance",
                                      color: AppColors.blackColor,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CustomText(
                                      title: "\$1000",
                                      color: AppColors.blackColor,
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                                Roundbutton(
                                  title: "Withdraw",
                                  buttonColor: AppColors.primaryColor,
                                  borderRadius: 8.r,
                                  onTap: () {
                                    Get.to(VendorWithdrawSuccessScreen());
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),

                // card list
                20.heightBox,
                SizedBox(
                  height: 60,
                  width: width,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 5),
                        child: _cardWidget(),
                      );
                    },
                  ),
                ),

                20.heightBox,
                CustomTextfieldWithLabel(
                  labelTextColor: Colors.black,
                  labelName: "Card number",
                  focusColor: AppColors.primaryColor,
                  hint: "1234 1234 1234 1234",
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      AppImages.cardsFixed,
                      scale: 4,
                      width: 60,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextfieldWithLabel(
                        labelTextColor: Colors.black,
                        labelName: "Expiration",
                        focusColor: AppColors.primaryColor,
                        hint: " MM / YY",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    10.widthBox,
                    Expanded(
                      child: CustomTextfieldWithLabel(
                        labelTextColor: Colors.black,
                        labelName: "CVC",
                        focusColor: AppColors.primaryColor,
                        hint: "CVC",
                        suffixIcon: Icon(Icons.credit_card),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ],
                ),
                _countrySelectWidget(),
              ],
            ),
          )
      ),
    );
  }

  Widget _cardWidget() {
    return Container(
      height: 60,
      width: 120,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                color: Colors.white,
                spreadRadius: 0,
                blurRadius: 5)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.credit_card,
            color: AppColors.primaryColor,
            size: 16,
          ),
          CustomText(
            title: "Card",
            color: AppColors.primaryColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Widget _countrySelectWidget(){
    return DropdownButtonFormField<String>(
      value: selectedCountry,
      hint: Text('Select a country'),
      items: countries.map((country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(country),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCountry = value;
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8.r)
          )
      ),
    );
  }

}

