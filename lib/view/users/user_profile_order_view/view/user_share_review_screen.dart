// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserShareReviewScreen extends StatelessWidget {
  const UserShareReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  HomeResturantAppBar(),


                  50.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Average Rating & Review count
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Average Rating
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '4.8 ★',
                                style: GoogleFonts.urbanist(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '1,64,002 Ratings\n&\n 5,922 Reviews',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.urbanist(
                                  fontSize: 10.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          // Rating Distribution Bars
                          Expanded(
                            child: Column(
                              children: [
                                ratingBar(5, 0.8),
                                ratingBar(4, 0.6),
                                ratingBar(3, 0.4),
                                ratingBar(2, 0.2),
                                ratingBar(1, 0.1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),

                      // User Rating Title
                      Center(
                        child: Text(
                          'What is your rate?',
                          style: GoogleFonts.urbanist(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Star Rating Input
                      Center(
                        child: RatingBar.builder(
                          initialRating: 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.orange, size: 12,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      SizedBox(height: 40),

                      // Share Review Button
                      Center(
                        child: Roundbutton(title: "Share Review",
                          buttonColor: AppColors.primaryColor,
                          borderRadius: 8.r,
                          onTap: () {
                        },),
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // Widget for creating the star rating distribution bar
  Widget ratingBar(int starCount, double fillPercent) {
    return Row(
      children: [
        Text(
          '$starCount ★',
          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: fillPercent,
                child: Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
