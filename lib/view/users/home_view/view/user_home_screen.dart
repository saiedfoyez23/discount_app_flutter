// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/view/users/home_view/view/recipes_screen.dart';
import 'package:discount_me_app/view/users/home_view/view/resturant_list_screen.dart';
import 'package:discount_me_app/view/users/home_view/widget/carousel_slider_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_appbar_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_catagory_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_populer_recipes_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_populer_resturant_widget.dart';
import 'package:discount_me_app/view/users/home_view/widget/home_searchbar_widget.dart';
import 'package:flutter/services.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Set the status bar style here
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set the status bar color
      statusBarIconBrightness:
          Brightness.dark, // Use Brightness.light for dark icons
    ));

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage(AppImages.homeBg), alignment: Alignment.topRight
        , opacity: 0.5),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  40.heightBox,
                  HomeAppbarWidget(),
                  15.heightBox,
//======================Search Section================================
                  RoundTextField(hint: "Search",
                  prefixIcon: Icon(Icons.search_outlined),),

                  20.heightBox,
                  SliderView(),

                  20.heightBox,
                  HomeCatagoryWidget(),

                  // Popular Recipes.......
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Popular Recipes 🔥",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: AppColors.blackColor,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.greenLightHover,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(RecipesScreen());
                          },
                          child: CustomText(
                            title: "See all",
                            color: AppColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  SizedBox(
                    height: Get.height / 3.1,
                    width: width,
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return HomePopulerRecipesWidget();
                      },
                    ),
                  ),

                  // Popular resturant.......
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "Popular Restaurants",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                        color: AppColors.blackColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(ResturantListScreen());
                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.orangeLight,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: CustomText(
                            title: "See all",
                            color: AppColors.secondaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: Get.height / 6,
                    width: width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 5, top: 10, bottom: 10),
                          child: HomePopulerResturantWidget(),
                        );
                      },
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
