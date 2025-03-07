// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/rider_earning_view/view/rider_payment_withdraw_screen.dart';
import 'package:discount_me_app/view/riders/rider_earning_view/widget/recent_transactions_widget.dart';
import 'package:discount_me_app/view/riders/rider_earning_view/widget/transaction_table_widget.dart';

class RiderProfileEarningHomeScreen extends StatelessWidget {
  const RiderProfileEarningHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: "Earnings",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [

              // wallet
              Container(
                padding: EdgeInsets.all(15),
                width: width,
                height: 200.h,
                decoration: BoxDecoration(
                  color: AppColors.greenLightHover,
                  image: DecorationImage(
                      image: AssetImage(AppImages.walletBg),
                      alignment: Alignment.centerRight),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CustomText(
                          title: "Your Balance",
                          color: AppColors.blackColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          title: "\$1000",
                          color: AppColors.blackColor,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    Roundbutton(
                      title: "Withdraw",
                      buttonColor: AppColors.primaryColor,
                      borderRadius: 8.r,
                      onTap: () {
                        Get.to(RiderPaymentWithdrawScreen());
                      },
                    )
                  ],
                ),
              ),

              // divider
              20.heightBox,
              RecentTransactionsWidget(),

              // transaction table
              20.heightBox,
              TransactionTableWidget(),


            ],
          ),
        ),
      ),
    );
  }
}
