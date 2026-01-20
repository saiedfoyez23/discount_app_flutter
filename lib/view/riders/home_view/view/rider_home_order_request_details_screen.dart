// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/riders/home_view/view/view_home_map_route_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RiderHomeOrderRequestDetailsScreen extends StatelessWidget {
  const RiderHomeOrderRequestDetailsScreen({super.key});

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
      backgroundColor: ColorUtils.whiteColor,
      appBar: AppBar(
      title: CustomText(title: "Order Details", fontWeight: FontWeight.w700, fontSize: 24.sp(context),),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60.w(context),
                        height: 60.h(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.lightBlueAccent),
                        child: Image.asset(
                          ImageUtils.homeProfileAvatar,
                          scale: 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Davidson Edgar",
                            fontSize: 18.sp(context),
                            fontWeight: FontWeight.w600,
                            color: ColorUtils.secondaryColor,
                          ),
                          CustomText(
                            title: "20 Deliveries",
                            fontSize: 14.sp(context),
                            fontWeight: FontWeight.w400,
                            color: ColorUtils.primaryColor,
                          ),
                          Row(
                            children: [
                              // 5-star rating icons
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4 ? Icons.star : Icons.star_half,
                                    size: 16.r(context), // Full star for 4, half star for 0.5
                                    color: ColorUtils.secondaryColor,
                                  );
                                }),
                              ),
                              SizedBox(
                                  width:
                                  8), // Small space between stars and the text
                              // Rating text
                              Text(
                                '4.5',
                                style: TextStyle(
                                    fontSize: 12.sp(context),
                                    fontWeight: FontWeight.w700,
                                    color: ColorUtils.primaryColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    ImageUtils.bikeVector,
                    scale: 4,
                    fit: BoxFit.cover,
                  ),
                ],
              ),


              30.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.orange,
                      ),
                      _dashedLineWidget(),
                      const Icon(
                        Icons.circle_outlined,
                        color: Colors.green,
                      ),
                      _dashedLineWidget(),
                      const Icon(
                        Icons.circle_outlined,
                        color: Colors.greenAccent,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Pickup Location',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('32 Samwell Sq, Chevron'),
                      SizedBox(height: 20),
                      Text(
                        'Delivery Location',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('21b, Karimu Kotun Street, Victoria Island'),
                    ],
                  )
                ],
              ),
              30.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "What you are sending",
                            color: ColorUtils.whiteDarkHover,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp(context),
                          ),
                          CustomText(
                            title: "Pizza",
                            color: ColorUtils.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp(context),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Receipient",
                            color: ColorUtils.whiteDarkHover,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp(context),
                          ),
                          CustomText(
                            title: "Donald Duck",
                            color: ColorUtils.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp(context),
                          )
                        ],
                      )
                    ],
                  ),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Receipient contact number",
                        color: ColorUtils.whiteDarkHover,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp(context),
                      ),
                      CustomText(
                        title: "08123456789",
                        color: ColorUtils.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp(context),
                      )
                    ],
                  ),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Fee:",
                        color: ColorUtils.whiteDarkHover,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp(context),
                      ),
                      CustomText(
                        title: "\$150",
                        color: ColorUtils.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp(context),
                      )
                    ],
                  ),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Pickup image(s)",
                        color: ColorUtils.whiteDarkHover,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp(context),
                      ),
                      10.heightBox,
                      Row(
                        children: List.generate(
                          3,
                              (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(
                                ImageUtils.burger,
                                scale: 4,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              20.heightBox,
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(ViewHomeMapRouteScreen());
                  },
                  child: Text(
                   "View Map Route",
                    style: GoogleFonts.urbanist(
                      color: ColorUtils.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp(context),
                      decoration: TextDecoration.underline,
                      decorationColor: ColorUtils.secondaryColor,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2.0,
                      shadows: [
                        Shadow(
                          offset: Offset(0, 2),
                          blurRadius: 10,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              40.heightBox,
              Row(
                children: [
                  Expanded(
                    child: Roundbutton(
                      borderRadius: 10.r(context),
                      titleColor: ColorUtils.secondaryColor,
                      buttonColor: Color(0xff086634).withOpacity(0.05),
                      title: "Reject",
                      onTap: () {},
                    ),
                  ),
                  10.widthBox,
                  Expanded(
                    child: Roundbutton(
                      borderRadius: 10.r(context),
                      buttonColor: ColorUtils.secondaryColor,
                      title: "Accept",
                      onTap: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
      ),
    );
  }

  Widget _dashedLineWidget() {
    return Column(
      children: List.generate(3, (index) {
        return Container(
          width: 6,
          height: 6,
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.green.shade200,
          ),
        );
      }),
    );
  }
}
