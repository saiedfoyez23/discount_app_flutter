// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/res/common_widget/country_code_picker.dart';
import 'package:discount_me_app/res/common_widget/custom_textfield_with_label.dart';
import 'package:discount_me_app/res/common_widget/picker_dialog.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class UserProfileEditScreen extends StatelessWidget {
  const UserProfileEditScreen({super.key});


  @override
  Widget build(BuildContext context) {
    UserProfileEditScreenWidget userProfileEditScreenWidget = Get.put(UserProfileEditScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onOpoInvoked) {
        Get.off(()=>UserHome(selectedIndex: 3,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: userProfileEditScreenWidget.userProfileEditScreenWidget(context: context),
      ),
    );
  }
}
