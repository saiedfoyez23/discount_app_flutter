// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_alert_dialog.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/view/riders/rider_earning_view/view/rider_profile_earing_home_screen.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_profile_edit_screen.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_setting_screen.dart';
import 'package:discount_me_app/view/users/profile_view/controller/nameController.dart';
import 'package:discount_me_app/view/users/profile_view/widget/profile_item_widget.dart';
import 'package:discount_me_app/view/view.dart';

class RiderProfileHome extends StatelessWidget {
  const RiderProfileHome({super.key});


  @override
  Widget build(BuildContext context) {
    RiderProfileHomeScreenWidget riderProfileHomeScreenWidget = Get.put(RiderProfileHomeScreenWidget(context: context));
    return Scaffold(
      body: riderProfileHomeScreenWidget.riderProfileHomeScreenWidget(context: context),
    );
  }
}
