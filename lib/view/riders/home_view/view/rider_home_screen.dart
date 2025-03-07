// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_alert_dialog.dart';
import 'package:discount_me_app/res/custom_style/custom_style.dart';
import 'package:discount_me_app/view/riders/home_view/view/rider_home_order_request_details_screen.dart';
import 'package:flutter/services.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class RiderHomeScreen extends StatefulWidget {
  const RiderHomeScreen({super.key});

  @override
  State<RiderHomeScreen> createState() => _RiderHomeScreenState();
}

class _RiderHomeScreenState extends State<RiderHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Set the status bar style here
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color
      statusBarIconBrightness:
      Brightness.dark, // Use Brightness.light for dark icons
    ));

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CustomText(title: "Welcome Back", fontSize: 14.sp, fontWeight: FontWeight.w400,),
                            CustomText(title: "Allan Smith", fontSize: 18.sp, fontWeight: FontWeight.w700,)
                          ],
                        ),

                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.lightBlueAccent
                          ),
                          child: Image.asset(AppImages.homeProfileAvatar, scale: 4, fit:BoxFit.cover,),
                        ),
                      ],
                    ),

//;;;;;;;;;;;;;;;;;;;; balance section;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    20.heightBox,
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CustomText(title: "Available balance",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),

                              Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "\$ ",
                                            style: GoogleFonts.urbanist(
                                                color: AppColors.whiteColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w700
                                            )
                                        ),
                                        TextSpan(
                                            text: "750.45",
                                            style: GoogleFonts.urbanist(
                                                color: AppColors.whiteColor,
                                                fontSize: 32,
                                                fontWeight: FontWeight.w700
                                            )
                                        ),
                                      ]
                                  )
                              ),
                            ],
                          ),

                          CustomText(title: "Withdrawal",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteColor,
                          ),

                        ],
                      ),
                    ),

                    // where to
                    20.heightBox,
                    Container(
                      decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xffe5e5e5), width: 1.17))
                      ),
                      child: Column(
                        children: [
                          20.heightBox,
                          Text(
                              "Would you like to specify direction for deliveries?",
                              style: GoogleFonts.inconsolata(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                              )
                          ),
                          10.heightBox,
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Where to?",
                              hintStyle: hintStyle,
                              prefixIcon: Icon(Icons.circle_outlined, color: Colors.green,),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.r)
                              ),
                              fillColor: Color(0xfff0f5f5),
                              filled: true,
                            ),
                          )

                        ],
                      ),
                    ),

                    // request section
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(title: "Available Requests",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),

                        CustomText(title: "View all",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),

                    10.heightBox,

                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return _requestWidget(width);
                      },
                    )


                  ],
                ),
              ),
            )
        ),
    );
  }

  Widget _requestWidget(width){
    return Container(
      width: width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.whiteNormalHover.withOpacity(0.1),
        border: Border(bottom: BorderSide(color: AppColors.whiteNormalHover, width: 1.17))

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomText(title: "Food Kind Restaurant",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryColor,
          ),
          5.heightBox,
          CustomText(title: "Receipient: Paul Pogba",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
          5.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.orangeLight,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Image.asset(AppImages.bikeVector, scale: 4,),
              ),
              20.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    Icon(Icons.location_on_outlined, color: AppColors.blackColor,),
                    CustomText(title: "Drop off",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ],
                  ),
                  5.heightBox,
                  CustomText(title: "Maryland bustop, Anthony Ikeja",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                  ),

                ],
              ),

            ],
          ),

          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Roundbutton(
                    title: "Reject",
                    borderRadius: 4,
                    buttonColor: Colors.transparent,
                    titleColor: Colors.red,
                    border: Border.all(width: 1, color: Colors.red),
                    onTap: () {
                      CustomAlertDialog().customAlert(
                          context: context,
                          title: 'Alert',
                          message: 'Are you sure you want to reject this request?',
                          NegativebuttonText: 'Cancel',
                          PositivvebuttonText: 'Confirm',
                          onPositiveButtonPressed: () => Navigator.of(context).pop(),
                          onNegativeButtonPressed: () => Navigator.of(context).pop(),
                      );
                      },
                  ),
              ),
              20.widthBox,
              Expanded(
                child: Roundbutton(
                  title: "View Details",
                  buttonColor: AppColors.secondaryColor,
                  borderRadius: 4,
                  onTap: () {
                    Get.to(RiderHomeOrderRequestDetailsScreen());
                  },
                ),
              )

            ],
          )

        ],
      ),
    );
  }

}
