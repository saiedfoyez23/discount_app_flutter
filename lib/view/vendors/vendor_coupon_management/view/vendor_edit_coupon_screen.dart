// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/view/users/coupon_view/view/payment_method_screen.dart';

class VendorEditCouponScreen extends StatelessWidget {
  const VendorEditCouponScreen({super.key});

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
                  // 10.heightBox,
                  // appBar
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back, color: Colors.black, size: 28,),
                            ) ,
                            // Centering the logo using Expanded and Align
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AppImages.discountMeLogo,
                                  scale: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // restaurant name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      CustomText(
                          title: "Coupon Card Name",
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                      SizedBox(height: 10.h),
                      RoundTextField(
                          hint: "Food King Restaurant",
                      ),
                    ],
                  ),

                  // coupon card name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      CustomText(
                          title: "Coupon Card Name Short Descriptions",
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                      SizedBox(height: 10.h),
                      RoundTextField(
                        hint: "description",
                      ),
                    ],
                  ),

                  // item price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      CustomText(
                          title: "Item Price",
                          color: AppColors.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                      SizedBox(height: 10.h),
                      RoundTextField(
                        hint: "\$50",
                      ),
                    ],
                  ),


                  SizedBox(height: 20.h),
                  Roundbutton(
                    title: "Update",
                    buttonColor: AppColors.secondaryColor,
                    titleColor: Colors.white,
                    borderRadius: 8.r,
                    onTap: () {
                    // functionality
                    },
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
