// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/chat_view/view/user_chat_vendor_list_screen.dart';
import 'package:discount_me_app/view/users/home_view/view/recipes_screen.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_resturant_app_bar.dart';
import 'package:discount_me_app/view/users/home_view/widget/resturant_profile_header_widget.dart';

class ResturantProfileScreen extends StatelessWidget {
  ResturantProfileScreen({super.key});





  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Calculate child aspect ratio dynamically (width-to-height ratio)
    double aspectRatio = (width / 2) / (height * 0.35);

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
                children: [

                  15.heightBox,
                  HomeResturantAppBar(),

                  // description
                  20.heightBox,
                  ResturantProfileHeaderWidget(),

                  // Recipes.......
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Items 🔥",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: AppColors.blackColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(RecipesScreen());
                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.greenLightHover,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: CustomText(
                            title: "See all",
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  15.heightBox,
                  GridView.builder(
                    itemCount: 4,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: width < 600 ? 2 : 3, // Responsive columns
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: aspectRatio, // Adjust child aspect ratio dynamically
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r), // Responsive border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1), // Subtle shadow for elevation
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(0, 2), // Slight shadow for depth
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top Image with rounded corners
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)), // Responsive border radius
                              child: Image.asset(
                                AppImages.poRecipeImg, // Replace with your image path
                                height: 180.h, // Responsive height
                                width: double.infinity, // Full width
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Padding around the text and details
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h), // Responsive padding
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    'Crazy Taco', // Replace with dynamic data if necessary
                                    style: GoogleFonts.urbanist(
                                      fontSize: 18.sp, // Responsive font size
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),

                                  SizedBox(height: 5.h), // Responsive height

                                  // Description
                                  Text(
                                    'Delicious tacos, appetizing...', // Short description
                                    style: GoogleFonts.urbanist(
                                      fontSize: 14.sp, // Responsive font size
                                      color: Colors.grey[600],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  SizedBox(height: 10.h), // Responsive height

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Icons with labels (Time estimate and rating)
                                      Row(
                                        children: [
                                          // Time icon and label
                                          Icon(Icons.access_time, size: 16.sp, color: Colors.orange),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '40-50min', // Time estimate
                                            style: GoogleFonts.urbanist(
                                              fontSize: 14.sp, // Responsive font size
                                              color: Colors.grey[700],
                                            ),
                                          ),

                                          SizedBox(width: 5.w),
                                          // Rating icon and label
                                          Icon(Icons.star, size: 16.sp, color: Colors.orange),
                                          SizedBox(width: 4.w),
                                          Text(
                                            '9.5', // Rating
                                            style: GoogleFonts.urbanist(
                                              fontSize: 14.sp, // Responsive font size
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Price
                                      Text(
                                        '\$45.5', // Replace with dynamic price
                                        style: GoogleFonts.urbanist(
                                          fontSize: 14.sp, // Responsive font size
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )

                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          onPressed: () {
            Get.to(UserChatVendorListScreen());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.supportChatIcon, scale: 4,),
              SizedBox(height: 5.h,),
              CustomText(
                title: "support",
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
