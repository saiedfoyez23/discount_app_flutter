import 'package:discount_me_app/res/common_widget/RoundButton.dart';
import 'package:discount_me_app/res/common_widget/custom_text.dart';
import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/view/broker_payment_withdraw_screen.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/widget/broker_transaction_table_widget.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/widget/custom_borker_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrokerHomeView extends StatelessWidget {
  const BrokerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
      
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomBrokerAppBar(),
      
                      // wallet

                      SpaceHelperWidget.v(20.h(context)),

                      Container(
                        padding: EdgeInsets.all(15),
                        height: 200.h(context),
                        decoration: BoxDecoration(
                          color: ColorUtils.greenLightHover,
                          image: DecorationImage(
                            image: AssetImage(ImageUtils.walletBg),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  title: "Your Balance",
                                  color: ColorUtils.blackColor,
                                  fontSize: 14.sp(context),
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  title: "\$1000",
                                  color: ColorUtils.blackColor,
                                  fontSize: 40.sp(context),
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                            Roundbutton(
                              title: "Withdraw",
                              buttonColor: ColorUtils.primaryColor,
                              borderRadius: 8.r(context),
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
                            color: ColorUtils.blackColor,
                            fontSize: 20.sp(context),
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            title: "GT-023821",
                            color: ColorUtils.secondaryColor,
                            fontSize: 32.sp(context),
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
                              height: 2,
                              decoration: BoxDecoration(
                                color: Color(0xffe4e4e4),
                              ),
                            ),
                          ),
                          Container(
                            width: 160.w(context),
                            alignment: Alignment.center,
                            child:  CustomText(
                              title: "Recent referral users",
                              color: ColorUtils.blackColor,
                              fontSize: 16.sp(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Container(
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
      
      
                      75.heightBox,
      
                    ],
                  ),
                ),
              ),
            ),
      
      
          ],
        ),
      ),
    );
  }
}