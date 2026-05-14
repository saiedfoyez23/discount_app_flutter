import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';


class PointsHomeView extends StatelessWidget {
  const PointsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final PointsHomeController pointsHomeController = Get.put(PointsHomeController(context: context));
    return Scaffold(
      body: Container(
        height: 926.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: ColorUtils.white253,
          image: DecorationImage(
            image: AssetImage(ImageUtils.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5,
          ),
        ),
        child: Obx(()=>Skeletonizer(
          effect: PulseEffect(),
          enabled: pointsHomeController.isLoading.value,
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
            
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpm(context)),
                    child: Column(
                      children: [
            
                        SpaceHelperWidget.v(20.h(context)),
            
            
                        Container(
                          width: 428.w(context),
                          decoration: BoxDecoration(
                              color: Colors.transparent
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
            
            
                                    ImageHelperWidget.circleImageHelperWidget(
                                      width: 45,
                                      height: 45,
                                      verticalPadding: 1,
                                      horizontalPadding: 1,
                                      backgroundColor: ColorUtils.orange213,
                                      radius: 25,
                                      context: context,
                                      imageAsset: pointsHomeController.userProfileResponseModel.value.data?.image ==  null ? ImageUtils.noImage : null,
                                      imageUrl: pointsHomeController.userProfileResponseModel.value.data?.image,
                                    ),
            
                                    SpaceHelperWidget.h(20.w(context)),
            
                                    Expanded(
                                      child: Center(
                                        child: ImageHelperWidget.assetImageWidget(
                                          context: context,
                                          height: 64.h(context),
                                          width: 170.w(context),
                                          imageString: ImageUtils.discountMeLogo,
                                        ),
                                      ),
                                    ),
            
            
                                  ],
                                ),
                              ),
            
                              SpaceHelperWidget.h(5.w(context)),
            
            
                              Row(
                                children: [
            
                                  InkWell(
                                    onTap: () {
                                      Get.off(()=>UserNotificationView(),preventDuplicates: false,duration: const Duration(milliseconds: 100));
                                    },
                                    child: Container(
                                      width: 45.w(context),
                                      height: 45.h(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.primaryColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: ColorUtils.whiteColor,
                                            blurRadius: 10,
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                      ),
                                      child: Icon(Icons.notifications, color: ColorUtils.whiteColor, size: 25.r(context),),
                                    ),
                                  ),
            
                                  SpaceHelperWidget.h(6.w(context)),
            
            
                                  InkWell(
                                    onTap: () {
                                      Get.off(()=> CartView(),preventDuplicates: false,duration: const Duration(milliseconds: 100));
                                    },
                                    child: Container(
                                      width: 45.w(context),
                                      height: 45.h(context),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.primaryColor,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: ColorUtils.whiteColor,
                                            blurRadius: 10,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(Icons.shopping_cart, color: ColorUtils.whiteColor,size: 22.r(context),),
                                    ),
                                  ),
            
                                ],
                              )
            
                            ],
                          ),
                        ),
            
            
                        SpaceHelperWidget.v(20.h(context)),
            
            
            
            
            
                      ],
                    ),
                  ),
                ),
            
            
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpm(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        
                        _pointsCard(
                          points: pointsHomeController.userProfileResponseModel.value.data?.totalRewardPoints.toString() ?? "0.0",
                          context: context,
                        ),
                        
                        SpaceHelperWidget.v(24.h(context)),
                        
            
                        _SectionLabel('HOW YOU EARN'),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.attach_money, size: 20, color: Colors.black),
                              SizedBox(width: 10),
                              Text(
                                '\$1 spent = 1 point earned',
                                style: TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
            
                        _SectionLabel('REWARD TIERS'),
                        const SizedBox(height: 12),
                        _TiersTable(tiers: pointsHomeController.tiers),
                        const SizedBox(height: 24),
            
                        _SectionLabel('YOUR PROGRESS'),
                        const SizedBox(height: 10),
                        _ProgressSection(),
                        const SizedBox(height: 28),
            
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Redeem my points',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),


                        const SizedBox(height: 28),
                      ],
                    ),
                  ),
                ),
                
                
              ],
            ),
          ),
        )),
      ),
    );
  }


  Widget _pointsCard({required String points,required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(10.r(context)),
      decoration: BoxDecoration(
        color: const Color(0xFFE6F7ED),
        borderRadius: BorderRadius.circular(16.r(context)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textColor: Color(0xFF6B7280),
                text: 'Your current points',
              ),


              SpaceHelperWidget.v(6.h(context)),


              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                fontSize: 34,
                fontWeight: FontWeight.w700,
                textColor: ColorUtils.black21,
                text: '${points}',
              ),

              SpaceHelperWidget.v(6.h(context)),

              TextHelperClass.headingTextWithoutWidth(
                context: context,
                alignment: Alignment.centerLeft,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textColor: Color(0xFF6B7280),
                text: 'pts',
              ),
              
            ],
          ),
          Container(
            width: 66.w(context),
            height: 66.h(context),
            decoration: const BoxDecoration(
              color: ColorUtils.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.star_outline, color: Colors.white, size: 36.r(context)),
          ),
        ],
      ),
    );
  }


}



class _TiersTable extends StatelessWidget {
  final List<Map<String, String>> tiers;
  const _TiersTable({required this.tiers});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E7EB), width: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            color: const Color(0xFFF9FAFB),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Points',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF374151),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Reward',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF374151),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0.5, thickness: 0.5, color: Color(0xFFE5E7EB)),
          ...List.generate(tiers.length, (i) {
            final tier = tiers[i];
            final isHighTier = i >= 2;
            final isLast = i == tiers.length - 1;
            return Column(
              children: [
                Container(
                  color: i.isOdd ? const Color(0xFFFAFAFA) : Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isHighTier
                                ? Colors.black
                                : const Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tier['points']!,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: isHighTier
                                  ? Colors.white
                                  : const Color(0xFF374151),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          tier['reward']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  const Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: Color(0xFFF3F4F6),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _ProgressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
            children: [
              TextSpan(text: 'Next reward: '),
              TextSpan(
                text: '500 pts',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(text: ' — 5% off'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: 1240 / 2000,
            minHeight: 8,
            backgroundColor: const Color(0xFFF3F4F6),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
        const SizedBox(height: 6),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1,240 pts',
              style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
            ),
            Text(
              '500 pts needed',
              style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
            ),
          ],
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF6B7280),
        letterSpacing: 0.6,
      ),
    );
  }
}


class CouponHomeScreen extends StatelessWidget {
  const CouponHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(ImageUtils.homeBg),
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

                  SizedBox(height: 20.h(context)),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          //Get.to(PaymentMethodScreen());
                        },
                        child: Stack(
                          children: [
                            Image.asset(
                              ImageUtils.couponBg, // Replace with your image path
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
                                          '\$10.99',
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
                                    padding: EdgeInsets.only(right: 40.w(context)), // Responsive padding using ScreenUtil
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Single Discount',
                                          style: GoogleFonts.urbanist(
                                            color: Colors.black,
                                            fontSize: 20.sp(context), // Responsive font size using ScreenUtil
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        5.heightBox,
                                        Text(
                                          'Customer takes 6 discount',
                                          style: GoogleFonts.urbanist(
                                            color: ColorUtils.whiteNormalActive,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp(context), // Responsive font size using ScreenUtil
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
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
