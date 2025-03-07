// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/home_view/view/view_home_map_route_screen.dart';
import 'package:discount_me_app/view/riders/rider_earning_view/view/rider_profile_earing_home_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_earning_view/view/vendor_earning_home_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/view/vendor_add_item_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/view/vendor_order_manage_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/widget/vendor_home_appbar.dart';
import 'package:discount_me_app/view/vendors/vendor_subscription_view/view/vendor_subscription_home_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VendorHomeScreen extends StatelessWidget {
  VendorHomeScreen({super.key});

  final double rating = 4.2;

  @override
  Widget build(BuildContext context) {
    // Set the status bar style here
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color
      statusBarIconBrightness:
      Brightness.dark, // Use Brightness.light for dark icons
    ));

    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VendorHomeAppbarWidget(),
                20.heightBox,

                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    AppImages.homeResProImg,
                    width: width,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),

                // resturant name and rating
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CustomText(title: 'Food King Restaurant', fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,),

                    Column(
                      children: [
                        // Rating
                        Row(
                          children: [
                           RatingBarIndicator(
                             itemSize: 14,
                               itemCount: 5,
                               rating: 4.2,
                               itemBuilder: (context, index) {
                                 return Icon(Icons.star, color: Colors.amber,);
                               },
                           ),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(), // Display the hardcoded rating number
                              style: GoogleFonts.urbanist(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        5.heightBox,
                        GestureDetector(
                          onTap: () {
                            Get.to(ViewHomeMapRouteScreen());
                          },
                          child: CustomText(title: 'View on Google Maps',color: AppColors.primaryColor, fontSize: 10,),
                        )
                      ],
                    )
                  ],
                ),
                20.heightBox,
                GridView(
                  shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.70
                    ),
                  children: [

                    _itemWidget(
                      img: AppImages.itemAddBg,
                      title: "Items Add",
                      onTap: () {
                        Get.to(()=>VendorAddItemScreen());
                      },),

                    _itemWidget(
                      img: AppImages.orderManageBg,
                      title: "Order Manage",
                      onTap: () {
                        Get.to(()=>VendorOrderManageScreen());
                      },),

                    _itemWidget(
                      img: AppImages.subscriptionBg,
                      title: "Subscription",
                      onTap: () {
                        Get.to(()=>VendorSubscriptionHomeScreen());
                      },),

                    _itemWidget(
                      img: AppImages.paymentRevBg,
                      title: "Payment & Revenue",
                      onTap: () {
                        Get.to(()=>VendorEaringHomeScreen());
                      },),


                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemWidget({required String img, required String title, required VoidCallback onTap}){
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Color(0xff8c8c8c)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.025),
              offset: Offset(0, 4.29),
              blurRadius: 4.29,
              spreadRadius: 0,
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
            Roundbutton(
              title: title,
              buttonColor: AppColors.secondaryColor,
              borderRadius: 5.r,
              fontSize: 12,
              titleColor: Colors.white,
              onTap: onTap,
            )
          ],
        ),
    );
  }

}
