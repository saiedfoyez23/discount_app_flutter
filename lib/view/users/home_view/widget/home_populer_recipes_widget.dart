import 'package:discount_me_app/res/app_const/import_list.dart';

class HomePopulerRecipesWidget extends StatelessWidget {
  const HomePopulerRecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: 280.w, // Adjust width based on your requirement
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              AppImages.poRecipeImg, // Replace with your image path
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Padding around the text and details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Crazy Taco', // Replace with dynamic data if necessary
                  style: GoogleFonts.urbanist(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 5.h),

                // Description
                Text(
                  'Delicious tacos, appetizing...', // Short description
                  style: GoogleFonts.urbanist(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 10.h),

                // Bottom section with icons, labels, and price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icons with labels (Time estimate and rating)
                    Row(
                      children: [
                        // Time icon and label
                        Icon(Icons.access_time, size: 16.sp, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          '40-50min', // Time estimate
                          style: GoogleFonts.urbanist(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(width: 10),

                        // Rating icon and label
                        Icon(Icons.star, size: 16.sp, color: Colors.orange),
                        SizedBox(width: 4),
                        Text(
                          '9.5', // Rating
                          style: GoogleFonts.urbanist(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),

                    // Price
                    Text(
                      '\$45.5', // Replace with dynamic price
                      style: GoogleFonts.urbanist(
                        fontSize: 18.sp,
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
  }
}
