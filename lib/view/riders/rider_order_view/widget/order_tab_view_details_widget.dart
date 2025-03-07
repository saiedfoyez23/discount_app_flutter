// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/home_view/view/rider_home_order_request_details_screen.dart';

class OrderTabViewDetailsWidget extends StatelessWidget {
  const OrderTabViewDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.whiteNormalHover.withOpacity(0.1),
          border: Border(bottom: BorderSide(color: AppColors.whiteNormalHover, width: 1.17))

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomText(title: "Food Kind Restaurant",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryColor,
          ),
          5.heightBox,
          CustomText(title: "Receipient: Paul Pogba",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
          10.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.orangeLight,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Image.asset(AppImages.bikeVector, scale: 4,),
              ),
              20.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: AppColors.blackColor,),
                      CustomText(title: "Drop off",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                  5.heightBox,
                  CustomText(title: "Maryland bustop, Anthony Ikeja",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondaryColor,
                  ),

                ],
              ),

            ],
          ),

          20.heightBox,
          Roundbutton(
            title: "View Details",
            padding_vertical: 12,
            buttonColor: AppColors.secondaryColor,
            borderRadius: 4,
            onTap: () {
              Get.to(RiderHomeOrderRequestDetailsScreen());
            },
          ),
        ],
      ),
    );
  }
}
