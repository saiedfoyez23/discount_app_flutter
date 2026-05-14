import 'package:discount_me_app/res/custom_style/custom_size.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';


class RiderSubscriptionView extends StatelessWidget {
  const RiderSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    RiderSubscriptionController riderSubscriptionController = Get.put(RiderSubscriptionController(context: context));
    return Scaffold(
      body: Obx(()=>Container(
        height: 926.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.whiteColor,
        ),
        child: Skeletonizer(
          effect: PulseEffect(),
          enabled: riderSubscriptionController.isLoading.value,
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

                if(riderSubscriptionController.getAllSettingResponseModel.value.data?.isEmpty == true || riderSubscriptionController.getAllSettingResponseModel.value.data == null)...[
                  SliverToBoxAdapter(
                    child: SizedBox.shrink(),
                  )
                ] else...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16.r(context)),
                      child: Column(
                        children: List.generate(riderSubscriptionController.getAllSettingResponseModel.value.data!.length, (index) {
                          return Center(
                            child: riderSubscriptionController.isSubmit.value == true ?
                            CircularProgressIndicator() :
                            InkWell(
                              onTap: () async {
                                riderSubscriptionController.isSubmit.value = true;
                                await riderSubscriptionController.createPaymentController(context: context);
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
                                                '\$${riderSubscriptionController.getAllSettingResponseModel.value.data?[index].riderMonthlySubscriptionFee}',
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
                                                'Take Rider Subscription',
                                                style: GoogleFonts.urbanist(
                                                  color: Colors.black,
                                                  fontSize: 20.sp(context), // Responsive font size using ScreenUtil
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              5.heightBox,
                                              Text(
                                                'From Total Rider Subscription',
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
