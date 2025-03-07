// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/home_view/view/order_complete_screen.dart';
import 'package:discount_me_app/view/users/home_view/view/recipes_screen.dart';
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(AppImages.homeBg),
              alignment: Alignment.topRight,
              opacity: 0.5,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.lightBlueAccent,
                                ),
                                child: Image.asset(
                                  AppImages.homeProfileAvatar,
                                  scale: 4,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                        GestureDetector(
                          onTap: () {
                            Get.to(UserNotificationScreen());
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.primaryColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.whiteColor,
                                  blurRadius: 10,
                                  offset: Offset(0, 1),
                                )
                              ],
                            ),
                            child: Icon(
                              Icons.notifications,
                              color: AppColors.whiteColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: "Order details",
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.blackColor,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(RecipesScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                  title: "Add More",
                                  color: AppColors.whiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                10.widthBox,
                                Icon(
                                  Icons.add,
                                  color: AppColors.whiteColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.w),
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(
                              AppImages.burgerCard,
                              scale: 4,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chicken Burger',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  'Burger Factory LTD',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                Text(
                                  'Rs 200',
                                  style: GoogleFonts.urbanist(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Quantity Selector
                          Row(
                            children: [
                              Container(
                                height: 32.h,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.greenLightHover,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.remove,
                                    color: AppColors.primaryColor,
                                  ),
                                  onPressed: () {
                                    // Reduce item quantity logic
                                  },
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '1', // Replace with dynamic value
                                style: GoogleFonts.urbanist(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                height: 32.h,
                                width: 32.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.primaryColor,
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.add, color: Colors.white),
                                  onPressed: () {
                                    // Increase item quantity logic
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),



              // Discount Voucher Section
              Padding(padding: EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 0.5)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title: 'Purchase Coupon Card ',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          /*Get.to(
                                  ()=>QrScannerScreen(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 500)
                          );*/
                        },
                        child: CustomText(title: 'Redeem', fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500,),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                width: width,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(AppImages.orderBg),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                    colorFilter: ColorFilter.mode(
                        AppColors.primaryColor, BlendMode.dstATop),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub-Total',
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                        Text(
                          'Rs 950',
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Charge',
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                        Text(
                          'Rs 50',
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                        Text(
                          'Rs 0',
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.manrope(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                        Text(
                          'Rs 1,000',
                          style: GoogleFonts.manrope(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xfffefeff),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Roundbutton(
                        title: "Place My Order",
                        titleColor: AppColors.primaryColor,
                        borderRadius: 8.r,
                        buttonColor: AppColors.whiteColor,
                        onTap: () {
                          Get.to(OrderCompleteScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
