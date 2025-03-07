// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';

class OrderOngoingWidget extends StatelessWidget {
  const OrderOngoingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
        color: AppColors.greyLightHover,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image of the food item
            Image.asset(
              AppImages.orderItemBg, scale: 4,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title text
                  Text('Best Burger',
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 6),
                  // Amount text
                  Text(
                    'Amount: \$34',
                    style: GoogleFonts.urbanist(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Date text
                  Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: 'Date: ',
                              style: GoogleFonts.urbanist(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            TextSpan(
                              text: '07/02/24 - 09/02/24',
                              style: GoogleFonts.urbanist(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                              ),
                            )
                          ]
                      )
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Ongoing background: #FFC60B;
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xffFFF9E7),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    'Ongoing',
                    style: TextStyle(
                      color: Color(0xffFFC60B),
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                ),

                SizedBox(height: 30),
                // Arrow icon for navigation
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
