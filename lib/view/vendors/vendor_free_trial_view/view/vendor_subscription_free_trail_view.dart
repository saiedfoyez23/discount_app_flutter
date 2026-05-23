import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VendorSubscriptionFreeTrailView extends StatelessWidget {
  const VendorSubscriptionFreeTrailView({super.key});

  @override
  Widget build(BuildContext context) {
    VendorSubscriptionFreeTrailController vendorSubscriptionFreeTrailController = Get.put(VendorSubscriptionFreeTrailController(context: context));
    return Scaffold(
      body: Obx(()=>Container(
        height: 926.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.whiteColor,
        ),
        child: Skeletonizer(
          effect: PulseEffect(),
          enabled: vendorSubscriptionFreeTrailController.isLoading.value,
          child: SafeArea(
            child: CustomScrollView(
              slivers: [


                SliverToBoxAdapter(
                  child: Column(
                    children: [

                      SpaceHelperWidget.v(20.h(context)),

                      UserProfileAppbarWidget(title: "Subscription", widget: SizedBox(),),

                      SpaceHelperWidget.v(20.h(context)),

                    ],
                  ),
                ),

                if(vendorSubscriptionFreeTrailController.getAllSettingResponseModel.value.data?.isEmpty == true || vendorSubscriptionFreeTrailController.getAllSettingResponseModel.value.data == null)...[
                  SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  )
                ] else...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16.r(context)),
                      child: Column(
                        children: List.generate(vendorSubscriptionFreeTrailController.getAllSettingResponseModel.value.data!.length, (index) {
                          return Center(
                            child: vendorSubscriptionFreeTrailController.isSubmit.value == true ?
                            CircularProgressIndicator() :
                            InkWell(
                              onTap: () async {
                                vendorSubscriptionFreeTrailController.isSubmit.value = true;
                                await vendorSubscriptionFreeTrailController.createPaymentController(context: context);
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                    ImageUtils.couponBg,
                                    scale: 4,
                                  ),
                                  Positioned.fill(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Price Section
                                        Padding(
                                          padding: EdgeInsets.only(left: 40.w(context)), // Responsive padding using ScreenUtil
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Price',
                                                style: GoogleFonts.urbanist(
                                                  color: Colors.green,
                                                  fontSize: 24.sp(context),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                '\$${vendorSubscriptionFreeTrailController.getAllSettingResponseModel.value.data?[index].brokerMonthlySubscriptionFee}',
                                                style: GoogleFonts.urbanist(
                                                  color: Colors.orange,
                                                  fontSize: 24.sp(context),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),



                                        // Discount Info Section
                                        Padding(
                                          padding: EdgeInsets.only(right: 40.w(context)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Take Vendor Subscription',
                                                style: GoogleFonts.urbanist(
                                                  color: Colors.black,
                                                  fontSize: 20.sp(context), // Responsive font size using ScreenUtil
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              5.heightBox,
                                              Text(
                                                'From Total Broker Subscription',
                                                style: GoogleFonts.urbanist(
                                                  color: ColorUtils.whiteNormalActive,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ]

              ],
            ),
          ),
        ),
      )),
    );
  }
}
