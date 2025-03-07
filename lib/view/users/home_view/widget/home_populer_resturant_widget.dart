// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart'; // For Urbanist Font
import 'package:flutter_screenutil/flutter_screenutil.dart'; // For responsive sizing

class HomePopulerResturantWidget extends StatelessWidget {
  HomePopulerResturantWidget({super.key});


  final double rating = 4.2; // Hardcoded rating value here

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.2,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Restaurant Image
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              AppImages.restuImg,
              height: Get.height / 8,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),

          // Right Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Top Row with Restaurant Name and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Restaurant Name
                    Expanded(
                      child: Text(
                        'Restaurant Name', // Replace with dynamic data
                        style: GoogleFonts.urbanist(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const SizedBox(width: 5),

                    // Rating
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemCount: 5,
                            rating: 4.2,
                            itemSize: 12,
                            itemBuilder: (context, index) {
                              return Icon(Icons.star, size: 12, color: Colors.amber,);
                            },
                        ),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(), // Display the hardcoded rating number
                          style: GoogleFonts.urbanist(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),



                // Description Text
                Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod...', // Replace with dynamic description
                  style: GoogleFonts.urbanist(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 6.h),

                // Location
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 16),
                    SizedBox(width: 2),
                    Text(
                      'Rampura, Banasree, Dhaka', // Replace with dynamic address
                      style: GoogleFonts.urbanist(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
