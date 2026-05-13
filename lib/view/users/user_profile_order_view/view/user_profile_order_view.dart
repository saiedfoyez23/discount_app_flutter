import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserProfileOrderView extends StatelessWidget {
  const UserProfileOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderStatusController orderStatusController = Get.put(OrderStatusController(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>UserDashboardView(index: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: Obx(()=>Skeletonizer(
          effect: PulseEffect(),
          enabled: orderStatusController.isLoading.value,
          child: RefreshIndicator(
            onRefresh: () async {
              Get.delete<OrderStatusController>(force: true);
              Get.off(()=>UserProfileOrderView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
            },
            child: Container(
              height: 926.h(context),
              width: 428.w(context),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(ImageUtils.homeBg),
                  alignment: Alignment.topRight,
                  opacity: 0.5,
                ),
              ),
              child: SafeArea(
                child: CustomScrollView(
                    slivers: [


                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.hpm(context)),
                          child: Column(
                            children: [

                              SpaceHelperWidget.v(20.h(context)),


                              UserProfileAppbarWidget(
                                title: "Order",
                                onTap: () {
                                  Get.off(()=>UserDashboardView(index: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                },
                              ),

                              SpaceHelperWidget.v(40.h(context)),


                            ],
                          ),
                        ),
                      ),


                      SliverFillRemaining(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.hpm(context)),
                          child: Column(
                            children: [

                              /// Tabs
                              Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: List.generate(orderStatusController.tabs.length, (i) {
                                  return GestureDetector(
                                    onTap: () => orderStatusController.changeTab(i),
                                    child: Column(
                                      children: [
                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          text: orderStatusController.tabs[i],
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          textColor:  orderStatusController.selectedTab.value == i ? orderStatusController.getTextColor(orderStatusController.tabs[i]) : Colors.black,
                                        ),
                                        SpaceHelperWidget.v(5.h(context)),

                                        Container(
                                          height: 2.h(context),
                                          width: 50.w(context),
                                          color: orderStatusController.selectedTab.value == i
                                              ? orderStatusController.getColor(orderStatusController.tabs[i])
                                              : Colors.transparent,
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              )),


                              SpaceHelperWidget.v(20.h(context)),



                              Expanded(
                                child: Obx(() {
                                  final list = orderStatusController.filteredOrders;

                                  if (list.isEmpty) {
                                    return Center(
                                      child: TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          text: "No Order Available",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          textColor: ColorUtils.black21,
                                          alignment: Alignment.center
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    itemCount: list.length,
                                    itemBuilder: (_, i) => OrderCardWidget(order: list[i]),
                                  );
                                }),
                              )
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
