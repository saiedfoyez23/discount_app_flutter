// ignore_for_file: prefer_const_constructors
import 'package:discount_me_app/view/brokers/broker_home_view/controller/broker_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';

class CustomBrokerAppBar extends StatelessWidget {
  CustomBrokerAppBar({super.key,required this.brokerHomeController,});

  final BrokerHomeController brokerHomeController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: Row(
            children: [


              ImageHelperWidget.circleImageHelperWidget(
                width: 50.w(context),
                height: 50.h(context),
                verticalPadding: 1.vpm(context),
                horizontalPadding: 1.hpm(context),
                backgroundColor: ColorUtils.orange213,
                radius: 25.r(context),
                imageAsset: brokerHomeController.getBrokerProfileResponseModel.value.data?.image ==  null ? ImageUtils.noImage : null,
                imageUrl: brokerHomeController.getBrokerProfileResponseModel.value.data?.image,
              ),


              SpaceHelperWidget.h(20.w(context)),

              // Centering the logo using Expanded and Align
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageUtils.discountMeLogo,
                    scale: 10,
                  ),
                ),
              ),
            ],
          ),
        ),

        InkWell(
          onTap: () {},
          child: Icon(Icons.notifications_outlined, color: Colors.black, size: 32),
        ),
      ],
    );
  }
}
