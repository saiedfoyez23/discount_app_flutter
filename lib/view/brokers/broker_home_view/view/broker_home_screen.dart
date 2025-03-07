// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/view/broker_payment_withdraw_screen.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/widget/broker_transaction_table_widget.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/widget/custom_borker_appbar.dart';
import 'package:discount_me_app/view/brokers/broker_referral_view/widget/referral_users_widget.dart';

class BrokerHomeScreen extends StatefulWidget {
  const BrokerHomeScreen({super.key});

  @override
  State<BrokerHomeScreen> createState() => _BrokerHomeScreenState();
}

class _BrokerHomeScreenState extends State<BrokerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              40.heightBox,
              CustomBrokerAppBar(),


              // wallet
              20.heightBox,
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
                        Get.to(BrokerPaymentWithdrawScreen());
                      },
                    )
                  ],
                ),
              ),

              20.heightBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    title: "Your Referral Code",
                    color: AppColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    title: "GT-023821",
                    color: AppColors.secondaryColor,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),

              // Recent referral users
              20.heightBox,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: width,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                  ),
                  Container(
                    width: 160.w,
                    alignment: Alignment.center,
                    child:  CustomText(
                      title: "Recent referral users",
                      color: AppColors.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                  ),
                ],
              ),

              // transaction table
              20.heightBox,
              BrokerTransactionTableWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
