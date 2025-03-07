// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';

class ResturantProfileHeaderWidget extends StatelessWidget {
  ResturantProfileHeaderWidget({super.key});
  final double rating = 4.2;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppImages.homeResProImg, scale: 4, width: width,),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: 'Restaurant Name', fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColors.blackColor,),
                5.heightBox,
                Row(
                  children: [
                    Icon(Icons.location_on,size: 16.sp, color: AppColors.primaryColor,),
                    5.widthBox,
                    CustomText(title: '1.2 km from Location', fontSize: 14,),
                  ],
                ),

              ],
            ),

            Column(
              children: [
                // Rating
                Row(
                  children: [
                    // Loop to show filled and empty stars based on hardcoded rating
                    ...List.generate(5, (index) {
                      if (index < rating.floor()) {
                        // Full star
                        return Icon(Icons.star, color: Colors.orange, size: 16.sp);
                      } else if (index < rating) {
                        // Half star (use Icons.star_half)
                        return Icon(Icons.star_half, color: Colors.orange, size: 16.sp);
                      } else {
                        // Empty star
                        return Icon(Icons.star_border, color: Colors.orange, size: 16.sp);
                      }
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

                  },
                  child: CustomText(title: 'View on Google Maps',color: AppColors.primaryColor, fontSize: 10,),
                )
              ],
            )

          ],
        ),

        20.heightBox,
        //   description
        CustomText(
          title: "Description",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor,
        ),

        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi",
          style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.blackColor
          ),
        )
      ],
    );
  }
}
