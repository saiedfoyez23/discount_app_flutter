// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/home_view/view/view_home_map_route_screen.dart';
import 'package:flutter/services.dart';

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
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
      title: CustomText(title: "Order Details", fontWeight: FontWeight.w700, fontSize: 24.sp,),
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
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.lightBlueAccent),
                        child: Image.asset(
                          AppImages.homeProfileAvatar,
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
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondaryColor,
                          ),
                          CustomText(
                            title: "20 Deliveries",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                          Row(
                            children: [
                              // 5-star rating icons
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4 ? Icons.star : Icons.star_half,
                                    size: 16
                                        .w
                                        .h, // Full star for 4, half star for 0.5
                                    color: AppColors.secondaryColor,
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
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    AppImages.bikeVector,
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
                            color: AppColors.whiteDarkHover,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                          CustomText(
                            title: "Pizza",
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Receipient",
                            color: AppColors.whiteDarkHover,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                          CustomText(
                            title: "Donald Duck",
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
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
                        color: AppColors.whiteDarkHover,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      CustomText(
                        title: "08123456789",
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      )
                    ],
                  ),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Fee:",
                        color: AppColors.whiteDarkHover,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      CustomText(
                        title: "\$150",
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      )
                    ],
                  ),
                  20.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Pickup image(s)",
                        color: AppColors.whiteDarkHover,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                      10.heightBox,
                      Row(
                        children: List.generate(
                          3,
                              (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Image.asset(
                                AppImages.burger,
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
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.secondaryColor,
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
                      borderRadius: 10.r,
                      titleColor: AppColors.secondaryColor,
                      buttonColor: Color(0xff086634).withOpacity(0.05),
                      title: "Reject",
                      onTap: () {},
                    ),
                  ),
                  10.widthBox,
                  Expanded(
                    child: Roundbutton(
                      borderRadius: 10.r,
                      buttonColor: AppColors.secondaryColor,
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
