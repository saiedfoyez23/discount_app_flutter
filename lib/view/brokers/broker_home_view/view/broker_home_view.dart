import 'package:discount_me_app/res/common_widget/custom_text.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/view/broker_payment_withdraw_screen.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/widget/broker_transaction_table_widget.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/widget/custom_borker_appbar.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BrokerHomeView extends StatelessWidget {
  const BrokerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    BrokerHomeController brokerHomeController = Get.put(BrokerHomeController(context: context));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(()=>Skeletonizer(
          effect: PulseEffect(),
          enabled: brokerHomeController.isLoading.value,
          child: CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hpm(context)),
                  child: Column(
                    children: [

                      CustomBrokerAppBar(),

                      // wallet

                      SpaceHelperWidget.v(20.h(context)),

                    ],
                  ),
                ),
              ),


              SliverFillRemaining(
                child: RefreshIndicator(
                  onRefresh: () async {
                    Get.off(()=>BrokerDashboardView(index: 0),preventDuplicates: false);
                  },
                  child: CustomScrollView(
                    slivers: [

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.vpm(context),horizontal: 16.hpm(context)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [



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
                                      RichTextHelperWidget.headingRichText(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        textAlign: TextAlign.start,
                                        textSpans: [
                                          CustomTextSpan(
                                            text: "Your Balance \n",
                                            fontSize: 16,
                                            color: ColorUtils.blackColor,
                                            fontWeight: FontWeight.w400,
                                          ).toTextSpan(),
                                          CustomTextSpan(
                                            height: 1.5,
                                            text: "\$${brokerHomeController.getBrokerProfileResponseModel.value.data?.balance ?? "0.0"}",
                                            fontSize: 40,
                                            fontWeight: FontWeight.w700,
                                            color: ColorUtils.blackColor,
                                          ).toTextSpan(),
                                        ],
                                      ),


                                      ButtonHelperWidget.customButtonWidget(
                                        context: context,
                                        height: 50,
                                        padding: EdgeInsets.symmetric(vertical: 11.vpm(context),horizontal: 11.hpm(context)),
                                        onPressed: () async {
                                          Get.to(BrokerPaymentWithdrawScreen());
                                        },
                                        text: "Withdraw",
                                        borderRadius: 8,
                                        backgroundColor: ColorUtils.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        textColor: ColorUtils.white255,
                                      ),


                                    ],
                                  ),
                                ),

                                SpaceHelperWidget.v(20.h(context)),


                                RichTextHelperWidget.headingRichText(
                                  context: context,
                                  alignment: Alignment.center,
                                  textAlign: TextAlign.center,
                                  textSpans: [
                                    CustomTextSpan(
                                      text: "Your Referral Code \n",
                                      fontSize: 20,
                                      color: ColorUtils.blackColor,
                                      fontWeight: FontWeight.w400,
                                    ).toTextSpan(),
                                    CustomTextSpan(
                                      text: "\$${brokerHomeController.getBrokerProfileResponseModel.value.data?.referralCode ?? ""}",
                                      fontSize: 32,
                                      height: 1.5,
                                      fontWeight: FontWeight.w700,
                                      color: ColorUtils.secondaryColor,
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                        Clipboard.setData(ClipboardData(text: "${brokerHomeController.getBrokerProfileResponseModel.value.data?.referralCode ?? ""}"));
                                      },
                                    ).toTextSpan(),
                                  ],
                                ),


                                SpaceHelperWidget.v(20.h(context)),


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
                                SpaceHelperWidget.v(20.h(context)),

                                BrokerTransactionTableWidget(),

                                SpaceHelperWidget.v(20.h(context)),


                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}