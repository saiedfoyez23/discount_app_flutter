// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/view/vendor_order_ongoing_status_screen.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/widget/order_order_going_widget.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/widget/vendor_order_canceled_widget.dart';
import 'package:discount_me_app/view/vendors/vendor_home_view/widget/vendor_order_delivered_widget.dart';

class VendorOrderManageScreen extends StatefulWidget {
  const VendorOrderManageScreen({super.key});

  @override
  State<VendorOrderManageScreen> createState() =>
      _VendorOrderManageScreenState();
}

class _VendorOrderManageScreenState extends State<VendorOrderManageScreen> {
  int selectedIndex = 0;

  // Define colors for each tab
  Color getTabColor(int index) {
    switch (index) {
      case 0:
        return AppColors.secondaryColor; // Ongoing
      case 1:
        return Colors.green; // Delivered
      case 2:
        return Colors.red; // Canceled
      default:
        return AppColors.primaryColor; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                UserProfileAppbarWidget(
                    title: "Order", onTap: () => Get.back()),
                Expanded(
                  child: DefaultTabController(
                    initialIndex: selectedIndex,
                    length: 3,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        toolbarHeight: 20,
                        automaticallyImplyLeading: false,
                        bottom: TabBar(
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          labelColor: getTabColor(selectedIndex),
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Ongoing'),
                            Tab(text: 'Delivered'),
                            Tab(text: 'Canceled'),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          // Ongoing Tab
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(VendorOrderOngoingStatusScreen());
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: VendorOrderOngoingWidget(),
                                ),
                              );
                            },
                          ),

                          // Delivered Tab
                          ListView.builder(
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: VendorOrderDeliveredWidget(),
                                ),
                              );
                            },
                          ),

                          // Canceled Tab
                          ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: VendorOrderCanceledWidget(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
