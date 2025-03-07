// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/riders/rider_order_view/widget/order_tab_view_details_widget.dart';
import 'package:discount_me_app/view/riders/rider_order_view/widget/requesting_widget.dart';

class RiderOrderHomeScreen extends StatelessWidget {
  const RiderOrderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          title: "Order",
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: DefaultTabController(
          initialIndex: 0,
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                isScrollable: true,
                physics: ScrollPhysics(),
                tabAlignment: TabAlignment.start,
                indicatorColor: AppColors.blackColor,
                labelColor: AppColors.secondaryColor,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'Requesting'),
                  Tab(text: 'Ongoing'),
                  Tab(text: 'Delivered'),
                  Tab(text: 'Canceled'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // Requesting Tab
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: RequestingWidget(),
                    );
                  },
                ),

                // Ongoing Tab
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: OrderTabViewDetailsWidget(),
                    );
                  },
                ),

                // Delivered Tab
                ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: OrderTabViewDetailsWidget(),
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
                      child: OrderTabViewDetailsWidget(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
