// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/res/common_widget/custom_dotted_widget.dart';
import 'package:discount_me_app/view/view.dart';

class VendorAddItemScreen extends StatelessWidget {
  const VendorAddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VendorAddItemScreenWidget vendorAddItemScreenWidget = Get.put(VendorAddItemScreenWidget(context: context));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (canPop,onPopInvoked) {
        Get.off(()=>VendorHome(selectedIndex: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
      },
      child: Scaffold(
        body: vendorAddItemScreenWidget.vendorAddItemScreenWidget(context: context),
      ),
    );
  }
}
