// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/view/users/home_view/view/resturant_profile_screen.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_appbar_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_populer_resturant_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_resturant_app_bar.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_searchbar_widget.dart';

class ResturantListScreen extends StatelessWidget {
  const ResturantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg), alignment: Alignment.topRight, opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  15.heightBox,
                  HomeResturantAppBar(),

                  15.heightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: "Find Nearby Restaurants",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp, color: AppColors.blackColor,
                      ),
                      8.heightBox,
                      RoundTextField(
                          hint: "Search",
                        focusColor: AppColors.secondaryColor,
                        prefixIcon: Icon(Icons.search_outlined),
                      ),
                    ],
                  ),

                  20.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ResturantProfileScreen());
                          },
                          child: HomePopulerResturantWidget(),
                        );
                      },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
