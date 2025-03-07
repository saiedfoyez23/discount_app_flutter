// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/widget/custom_borker_appbar.dart';
import 'package:discount_me_app/view/brokers/broker_referral_view/widget/referral_users_widget.dart';

class BrokerReferralHomeScreen extends StatefulWidget {
  const BrokerReferralHomeScreen({super.key});

  @override
  State<BrokerReferralHomeScreen> createState() => _BrokerReferralHomeScreenState();
}

class _BrokerReferralHomeScreenState extends State<BrokerReferralHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomBrokerAppBar(),


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
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        alignment: Alignment.center,
                        child:  CustomText(
                          title: "Referral users",
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

                  20.heightBox,
                  ReferralUsersWidgets(),


                ],
              ),
            ),
          )
      ),
    );
  }
}

