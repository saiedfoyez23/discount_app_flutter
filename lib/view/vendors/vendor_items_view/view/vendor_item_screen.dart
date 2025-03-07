// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_searchbar_widget.dart';
import 'package:discount_me_app/view/vendors/vendor_items_view/widget/vendor_category_widget.dart';

class Vendor_items_screen extends StatelessWidget {
  const Vendor_items_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Calculate child aspect ratio dynamically (width-to-height ratio)
    double aspectRatio = (width / 2) / (height * 0.35);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          title: "Items",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white,
          ),
        ),
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              RoundTextField(
                hint: "Search",
                focusColor: AppColors.secondaryColor,
                prefixIcon: Icon(Icons.search_outlined),
                onTap: () {

                },
              ),

              // category
              20.heightBox,
              VendorCategoryWidget(),



              20.heightBox,
              GridView.builder(
                itemCount: 20,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < 600 ? 2 : 3, // Responsive columns
                  mainAxisSpacing: 10.h, // Responsive spacing
                  crossAxisSpacing: 10.w, // Responsive spacing
                  childAspectRatio:
                      aspectRatio, // Adjust child aspect ratio dynamically
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          15.r), // Responsive border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.1), // Subtle shadow for elevation
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
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                  15.r)), // Responsive border radius
                          child: Image.asset(
                            AppImages
                                .poRecipeImg, // Replace with your image path
                            height: 180.h, // Responsive height
                            width: double.infinity, // Full width
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Padding around the text and details
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h), // Responsive padding
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Icons with labels (Time estimate and rating)
                                  Row(
                                    children: [
                                      // Time icon and label
                                      Icon(Icons.access_time,
                                          size: 16.sp, color: Colors.orange),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '40-50min', // Time estimate
                                        style: GoogleFonts.urbanist(
                                          fontSize:
                                              14.sp, // Responsive font size
                                          color: Colors.grey[700],
                                        ),
                                      ),

                                      SizedBox(width: 5.w),
                                      // Rating icon and label
                                      Icon(Icons.star,
                                          size: 16.sp, color: Colors.orange),
                                      SizedBox(width: 4.w),
                                      Text(
                                        '9.5', // Rating
                                        style: GoogleFonts.urbanist(
                                          fontSize:
                                              14.sp, // Responsive font size
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
