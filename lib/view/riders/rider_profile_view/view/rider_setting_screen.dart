// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/rider_profile_view/view/rider_change_password_screen.dart';
import 'package:discount_me_app/view/view.dart';

class RiderSettingScreen extends StatelessWidget {
  RiderSettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    RiderSettingScreenWidget riderSettingScreenWidget = Get.put(RiderSettingScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>RiderHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: riderSettingScreenWidget.riderSettingScreenWidget(context: context),
      ),
    );
  }
}
