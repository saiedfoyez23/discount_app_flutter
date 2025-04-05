// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/profile_view/controller/change_password_controller.dart';
import 'package:discount_me_app/view/view.dart';

class RiderChangePasswordScreen extends StatelessWidget {
  RiderChangePasswordScreen({super.key});
  
  
  RiderChangePasswordScreenWidget riderChangePasswordScreenWidget = Get.put(RiderChangePasswordScreenWidget());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: riderChangePasswordScreenWidget.riderChangePasswordScreenWidget(context: context),
    );
  }
}
