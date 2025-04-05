// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/view.dart';

class UserProfileSettingScreen extends StatelessWidget {
  UserProfileSettingScreen({super.key});



  @override
  Widget build(BuildContext context) {
    UserProfileSettingScreenWidget userProfileSettingScreenWidget = Get.put(UserProfileSettingScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: userProfileSettingScreenWidget.userProfileSettingScreenWidget(context: context),
      ),
    );
  }
}
