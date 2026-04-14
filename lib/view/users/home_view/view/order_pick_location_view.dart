import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/users/home_view/controller/order_pick_location_controller.dart';
import 'package:discount_me_app/view/users/home_view/view/order_select_address_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../res/res.dart';

class OrderPickLocationView extends StatelessWidget {
  OrderPickLocationView({super.key});

  final OrderPickLocationController orderPickLocationController = Get.put(OrderPickLocationController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>OrderScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: Container(
          height: 926.h(context),
          width: 428.w(context),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Obx(()=>Skeletonizer(
            effect: PulseEffect(),
            enabled: orderPickLocationController.isLoading.value,
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.hpm(context)),
                    child: Column(
                      children: [

                        CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                        UserProfileAppbarWidget(
                          title: "Pick Location",
                          onTap: () {
                            Get.off(()=>OrderScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                          },
                        ),

                      ],
                    ),
                  ),
                ),

                SliverFillRemaining(
                  child: Column(
                    children: [

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                      Expanded(
                        child: Obx(() => GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: orderPickLocationController.initialPosition.value,
                            zoom: 15,
                          ),
                          onMapCreated: orderPickLocationController.onMapCreated,
                          markers: orderPickLocationController.markers,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                        ),),
                      ),


                      Padding(
                        padding: EdgeInsets.all(16.r(context)),
                        child: CustomButtonContainer.plainButtonContainer(
                          plainButtonHeight: 64.h(context),
                          plainButtonWidth: 428.w(context),
                          plainButtonRadius: 8.r(context),
                          plainButtonOnPress:  () async {
                            if(orderPickLocationController.locationPicker.value == "") {
                              MessageSnackBarWidget.errorSnackBarWidget(context: context,message: "Address is not pick.");
                            } else {
                              Get.off(()=>OrderSelectAddressView(pickAddress: orderPickLocationController.locationPicker.value),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                            }
                          },
                          plainButtonHint: "Complete Order",
                          plainButtonHintFontSize: 22.sp(context),
                          plainButtonColor: ColorUtils.green176,
                          plainButtonHintFontColor: ColorUtils.white255,
                        ),
                      )


                    ],
                  ),
                )

              ],
            ),
          )),
        ),
      ),
    );
  }
}
