import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/res/res.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../res/common_widget/RoundTextField.dart';
import '../../../view.dart';
import '../../profile_view/view/user_notification_screen.dart';
import '../view/order_screen.dart';

class UserHomeScreenWidget extends GetxController {


  Future<void> determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude);
    print(position.latitude);
  }

  Future<String> _getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];
      return "${place.street}, ${place.locality}, ${place.subAdministrativeArea},${place.administrativeArea}, ${place.country}";
    } catch (e) {
      return "Place in not found";
    }
  }

  final RxList<String> imageList = [
    AppImages.sliderImg, // Replace with actual asset paths or URLs
    AppImages.sliderImg,
    AppImages.sliderImg,
  ].obs;

  Rx<PageController> pageController = PageController(initialPage: 0).obs; // Start at the first page
  var currentPage = 0.obs;
  Timer? _timer;



  void onPageChanged(int page) {
    currentPage.value = page;
  }

  Future<void> startAutoPlay() async {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage.value < 2) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      if (pageController.value.hasClients) {
        pageController.value.animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 350),
          curve: Curves.linearToEaseOut, // Swapping-like effect
        );
      }
    });
  }


  Future<void> checkLocationPermission() async {
    Future.delayed(const Duration(milliseconds: 500),() async {
      LocationPermission permission;
      var checkPermission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      print(permission);
      if(permission == LocationPermission.denied){
        await checkLocationPermission();
      }else if(permission == LocationPermission.deniedForever){
        CustomSnackBar().errorCustomSnackBar(context: context, message: "Location Permission need.Please go to app setting or unInstall the app");
      }else {
        await determinePosition();
      }
    });
  }


  RxBool isLoading = false.obs;
  Rx<CategoriesResponseModel> categoriesResponseModel = CategoriesResponseModel().obs;
  Rx<ProductsResponseModel> productsResponseModel = ProductsResponseModel().obs;
  Rx<StoresResponseModel> storesResponseModel = StoresResponseModel().obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  BuildContext context;
  UserHomeScreenWidget({required this.context});




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await UserHomeController.getCategoriesApiService(
          onSuccess: (e) {
            categoriesResponseModel.value = CategoriesResponseModel.fromJson(e);
          },
          onFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          },
          onExceptionFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          }
      );
      await UserHomeController.getProductsApiService(
          onSuccess: (e) {
            productsResponseModel.value = ProductsResponseModel.fromJson(e);
          },
          onFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          },
          onExceptionFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          }
      );
      await UserHomeController.getStoriesApiService(
          onSuccess: (e) {
            storesResponseModel.value = StoresResponseModel.fromJson(e);
          },
          onFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          },
          onExceptionFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          }
      );
      await UserProfileController.getUserProfileApiService(
          onSuccess: (e) {
            isLoading.value = false;
            userProfileResponseModel.value = UserProfileResponseModel.fromJson(e);
          },
          onFail: (e) {
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          },
          onExceptionFail: (e) async {
            if(e == "jwt expired") {
              await AppLocalStorage.removeKey(key: "Login");
              Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
            }
            isLoading.value = false;
            CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
          }
      );
      await checkLocationPermission();
    });
  }


  Widget userHomeScreenWidget({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(AppImages.homeBg),
          alignment: Alignment.topRight,
          opacity: 0.5,
        ),
      ),
      child: Obx(()=>Skeletonizer(
        effect: PulseEffect(),
        enabled: isLoading.value,
        child: RefreshIndicator(
          onRefresh: () async {
            Get.off(()=>UserHome(selectedIndex: 0,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
          },
          child: CustomScrollView(
            slivers: [

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                  child: Column(
                    children: [
                      CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),

                      // App Bar

                      Container(
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [

                                  userProfileResponseModel.value.data?.image == null ?
                                  Container(
                                    width: 40.w(context),
                                    height: 40.h(context),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.lightBlueAccent,
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.homeProfileAvatar),
                                        fit: BoxFit.fitHeight,
                                      )
                                    ),
                                  ) :
                                  Container(
                                    width: 40.w(context),
                                    height: 40.h(context),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightBlueAccent,
                                        image: DecorationImage(
                                          image: NetworkImage(userProfileResponseModel.value.data!.image),
                                          fit: BoxFit.fitHeight,
                                        )
                                    ),
                                  ),

                                  CustomSpaceWidget.spacerWidget(spaceWidth: 20.w(context)),

                                  Icon(Icons.location_on, size: 16.r(context),),
                                  CustomSpaceWidget.spacerWidget(spaceWidth: 5.w(context)),

                                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                    plainTextString: userProfileResponseModel.value.data?.location ?? "N/A",
                                    plainTextStringFontSize: 16.sp(context),
                                    plainTextStringFontWeight: FontWeight.w400,
                                    plainTextContainerAlignment: Alignment.centerLeft,
                                    plainTextStringColor: AppColors.black29,
                                    plainTextStringTextAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              children: [

                                GestureDetector(
                                  onTap: () {
                                    Get.to(UserNotificationScreen());
                                  },
                                  child: Container(
                                    width: 45.w(context),
                                    height: 45.h(context),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primaryColor,
                                        boxShadow: const [
                                          BoxShadow(color: AppColors.whiteColor,
                                              blurRadius: 10, offset: Offset(0, 1))
                                        ]
                                    ),
                                    child: Icon(Icons.notifications, color: AppColors.whiteColor, size: 25.r(context),),
                                  ),
                                ),

                                CustomSpaceWidget.spacerWidget(spaceWidth: 6.w(context)),

                                GestureDetector(
                                  onTap: () {
                                    Get.to(OrderScreen());
                                  },
                                  child: Container(
                                    width: 45.w(context),
                                    height: 45.h(context),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primaryColor,
                                        boxShadow: const [
                                          BoxShadow(color: AppColors.whiteColor,
                                              blurRadius: 10, offset: Offset(0, 2))
                                        ]
                                    ),
                                    child: Icon(Icons.shopping_cart, color: AppColors.whiteColor,size: 22.r(context),),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),


                      CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),

                      //======================Search Section================================
                      RoundTextField(
                        hint: "Search",
                        prefixIcon: Icon(Icons.search_outlined),
                        onTap: () async {
                          Get.off(ProductListScreen(categoryId: "",storeId: "",),preventDuplicates: false,duration: Duration(milliseconds: 100));
                        },
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                      Container(
                        height: 250.h(context),
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: imageList.isNotEmpty == true ?
                        Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                onPageChanged: (value) {
                                  onPageChanged(value);
                                },
                                controller: pageController.value,
                                scrollDirection: Axis.horizontal,
                                itemCount: imageList.length,
                                itemBuilder: (context, index) {
                                  return _buildScalingTransition(imageList[index], index);
                                },
                              ),
                            ),
                            CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                            SmoothPageIndicator(
                              controller: pageController.value,
                              count: imageList.length,
                              effect: ExpandingDotsEffect(
                                activeDotColor: Colors.deepPurple,
                                dotColor: Colors.deepPurple.shade100,
                                dotHeight: 10,
                                dotWidth: 10,
                              ),
                            ),
                          ],
                        ) :
                        CustomSpaceWidget.spacerWidget(),
                      ),

                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                      categoriesResponseModel.value.categories?.isNotEmpty == true || categoriesResponseModel.value.categories != null ?
                      Container(
                        height: 120.h(context),
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesResponseModel.value.categories?.length,
                          padding: EdgeInsets.all(5),
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Obx(()=>Container(
                              height: 90.h(context),
                              width: 90.w(context),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.hpm(context),
                                vertical: 10.vpm(context),
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white, // Color of the container
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08), // Shadow color with opacity
                                      spreadRadius: 0, // Spread radius of the shadow
                                      blurRadius: 8, // Blur radius of the shadow
                                      offset: Offset(0, 2), // Offset of the shadow (x, y)
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(8.r(context))
                              ),
                              margin: EdgeInsets.only(right: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () async {
                                  Get.off(ProductListScreen(categoryId: categoriesResponseModel.value.categories![index].sId,storeId: "",),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImageContainer.networkImageContainer(
                                        height: 40.h(context),
                                        width: 40.w(context),
                                        networkImage: categoriesResponseModel.value.categories?[index].icon
                                    ),
                                    CustomSpaceWidget.spacerWidget(spaceHeight: 6.h(context)),
                                    CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                      plainTextString: categoriesResponseModel.value.categories?[index].name,
                                      plainTextStringFontSize: 14.sp(context),
                                      plainTextStringFontWeight: FontWeight.w500,
                                      plainTextContainerAlignment: Alignment.center,
                                      plainTextStringColor: AppColors.black29,
                                      plainTextStringTextAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          },
                        ),
                      ) :
                      Container(
                        height: 120.h(context),
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ) ,

                      // Popular Recipes.......
                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                            plainTextString: "Popular Products",
                            plainTextStringFontSize: 22.sp(context),
                            plainTextStringFontWeight: FontWeight.w700,
                            plainTextContainerAlignment: Alignment.centerLeft,
                            plainTextStringColor: AppColors.black29,
                            plainTextStringTextAlign: TextAlign.start,
                          ),

                          Container(
                            height: 30.h(context),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.hpm(context),
                              vertical: 5.vpm(context),
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.greenLightHover,
                              borderRadius: BorderRadius.circular(50.r(context)),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(ProductListScreen(categoryId: "",storeId: "",),preventDuplicates: false,duration: Duration(milliseconds: 100));
                              },
                              child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "See all",
                                plainTextStringFontSize: 14.sp(context),
                                plainTextStringFontWeight: FontWeight.w400,
                                plainTextContainerAlignment: Alignment.center,
                                plainTextStringColor: AppColors.primaryColor,
                                plainTextStringTextAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),



                      CustomSpaceWidget.spacerWidget(spaceHeight: 10.h(context)),
                      productsResponseModel.value.data?.data?.isNotEmpty == true || productsResponseModel.value.data?.data != null ?
                      Container(
                        height: 320.h(context),
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: ListView.builder(
                          itemCount: productsResponseModel.value.data?.data?.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Obx(()=>Stack(
                              children: [

                                TextButton(
                                  onPressed: () async {
                                    Get.off(SingleProductViewScreen(
                                      productId: productsResponseModel.value.data!.data![index].sId,
                                      isSingleStoreScreen: false,
                                      isHomeScreen: true,
                                      isProductListPage: false,
                                      isExplorePage: false,
                                      storeId: '',
                                      isStoreScreen: false,
                                    ),duration: Duration(milliseconds: 100),preventDuplicates: false);
                                  },
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  child: Container(
                                    width: 280.w(context), // Adjust width based on your requirement
                                    margin: EdgeInsets.symmetric(
                                      vertical: 5.vpm(context),
                                      horizontal: 5.hpm(context),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.r(context)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1), // Subtle shadow for elevation
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: Offset(0, 2), // Slight shadow for depth
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Top Image with rounded corners
                                        ClipRRect(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(15.r(context))),
                                          child: Image.network(
                                            productsResponseModel.value.data!.data![index].images!.first, // Replace with your image path
                                            height: 140.h(context),
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        // Padding around the text and details
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.hpm(context),
                                            vertical: 8.vpm(context),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Title

                                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                plainTextString: productsResponseModel.value.data?.data?[index].name ?? "N/A",
                                                plainTextStringFontSize: 22.sp(context),
                                                plainTextStringFontWeight: FontWeight.w700,
                                                plainTextContainerAlignment: Alignment.centerLeft,
                                                plainTextStringColor: AppColors.black29,
                                                plainTextStringTextAlign: TextAlign.start,
                                              ),


                                              SizedBox(height: 5.h(context)),

                                              // Description
                                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                plainTextString: productsResponseModel.value.data?.data?[index].description != null ?
                                                "${productsResponseModel.value.data!.data![index].description.toString().length > 50 ?
                                                productsResponseModel.value.data!.data![index].description.toString().substring(0,50) :
                                                productsResponseModel.value.data!.data![index].description.toString()}...." : "N/A",
                                                plainTextStringFontSize: 14.sp(context),
                                                plainTextStringFontWeight: FontWeight.w700,
                                                plainTextContainerAlignment: Alignment.centerLeft,
                                                plainTextStringColor: Colors.grey.shade600,
                                                plainTextStringTextAlign: TextAlign.start,
                                              ),


                                              SizedBox(height: 10.h(context)),

                                              // Bottom section with icons, labels, and price
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  // Icons with labels (Time estimate and rating)
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        // Time icon and label
                                                        Icon(Icons.ac_unit, size: 16.r(context), color: Colors.orange),
                                                        SizedBox(width: 4.w(context)),
                                                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                          plainTextString: productsResponseModel.value.data?.data?[index].quantity != null ?
                                                          "${productsResponseModel.value.data?.data?[index].quantity} pics" : "N/A",
                                                          plainTextStringFontSize: 14.sp(context),
                                                          plainTextStringFontWeight: FontWeight.w500,
                                                          plainTextContainerAlignment: Alignment.centerLeft,
                                                          plainTextStringColor: Colors.grey.shade700,
                                                          plainTextStringTextAlign: TextAlign.start,
                                                        ),



                                                        SizedBox(width: 10.w(context)),

                                                        // Rating icon and label
                                                        Icon(Icons.star, size: 16.r(context), color: Colors.orange),
                                                        SizedBox(width: 4.w(context)),

                                                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                          plainTextString: productsResponseModel.value.data?.data?[index].ratings != null ?
                                                          "${productsResponseModel.value.data?.data?[index].ratings}" : "N/A",
                                                          plainTextStringFontSize: 14.sp(context),
                                                          plainTextStringFontWeight: FontWeight.w500,
                                                          plainTextContainerAlignment: Alignment.centerLeft,
                                                          plainTextStringColor: Colors.grey.shade700,
                                                          plainTextStringTextAlign: TextAlign.start,
                                                        ),
                                                      ],
                                                    ),
                                                  ),


                                                  CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                    plainTextString: productsResponseModel.value.data?.data?[index].price != null ?
                                                    "${"\$"}${productsResponseModel.value.data!.data![index].price.toString()}" : "N/A",
                                                    plainTextStringFontSize: 22.sp(context),
                                                    plainTextStringFontWeight: FontWeight.w700,
                                                    plainTextContainerAlignment: Alignment.centerLeft,
                                                    plainTextStringColor: AppColors.black29,
                                                    plainTextStringTextAlign: TextAlign.start,
                                                  ),


                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                                Positioned(
                                  top: 100.h(context),
                                  left: 10.w(context),
                                  child: Container(
                                    height: 40.h(context),
                                    decoration: BoxDecoration(
                                      color: AppColors.white246,
                                      borderRadius: BorderRadius.circular(12.r(context)),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                        plainTextString: "Add To Cart",
                                        plainTextStringFontSize: 12.sp(context),
                                        plainTextStringFontWeight: FontWeight.w700,
                                        plainTextContainerAlignment: Alignment.centerLeft,
                                        plainTextStringColor: AppColors.black29,
                                        plainTextStringTextAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ));
                          },
                        ),
                      ) :
                      Container(
                        height: 320.h(context),
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),

                      // Popular resturant.......
                      CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                            plainTextString: "Popular Stores",
                            plainTextStringFontSize: 22.sp(context),
                            plainTextStringFontWeight: FontWeight.w700,
                            plainTextContainerAlignment: Alignment.centerLeft,
                            plainTextStringColor: AppColors.black29,
                            plainTextStringTextAlign: TextAlign.start,
                          ),
                          Container(
                            height: 30.h(context),
                            padding: EdgeInsets.symmetric(horizontal: 15.hpm(context), vertical: 5.vpm(context)),
                            decoration: BoxDecoration(
                              color: AppColors.orangeLight,
                              borderRadius: BorderRadius.circular(50.r(context)),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Get.off(StoreListViewScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                //Get.to(ResturantListScreen());
                              },
                              child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "See all",
                                plainTextStringFontSize: 14.sp(context),
                                plainTextStringFontWeight: FontWeight.w400,
                                plainTextContainerAlignment: Alignment.center,
                                plainTextStringColor: AppColors.secondaryColor,
                                plainTextStringTextAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),

                      storesResponseModel.value.data?.data?.isNotEmpty == true || storesResponseModel.value.data?.data != null ?
                      Container(
                        height: 200.h(context),
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: storesResponseModel.value.data?.data?.length,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: 10.lpm(context),
                                right: 2.rpm(context),
                                top: 10.tpm(context),
                                bottom: 10.bpm(context),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  Get.off(()=>SingleStoreViewScreen(
                                    storeId: storesResponseModel.value.data!.data![index].sId,
                                    isHomePage: true,
                                    isStoreListPage: false,
                                  ),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                },
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                child: Container(
                                  width: 310.w(context),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.vpm(context),
                                    horizontal: 10.hpm(context),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.r(context)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: const Offset(0, 2), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Restaurant Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5.r(context)),
                                        child: Image.network(
                                          storesResponseModel.value.data!.data![index].coverImages!.first,
                                          height: 180.h(context),
                                          width: 90.w(context),
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      SizedBox(width: 10.w(context)),

                                      // Right Section
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            // Top Row with Restaurant Name and Rating
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                // Restaurant Name
                                                Expanded(
                                                  child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                    plainTextString: storesResponseModel.value.data!.data![index].name,
                                                    plainTextStringFontSize: 14.sp(context),
                                                    plainTextStringFontWeight: FontWeight.w700,
                                                    plainTextContainerAlignment: Alignment.centerLeft,
                                                    plainTextStringColor: AppColors.black29,
                                                    plainTextStringTextAlign: TextAlign.start,
                                                  ),
                                                ),

                                                SizedBox(width: 5.w(context)),

                                                // Rating
                                                Row(
                                                  children: [
                                                    Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: List.generate(5, (Index) {
                                                        // Calculate the fill amount for each star
                                                        double starValue = double.parse(storesResponseModel.value.data!.data![index].ratings.toString()) - Index;
                                                        bool isFilled = starValue >= 1.0;
                                                        bool isHalfFilled = starValue > 0.0 && starValue < 1.0;

                                                        return Icon(
                                                          isFilled
                                                              ? Icons.star
                                                              : isHalfFilled
                                                              ? Icons.star_half
                                                              : Icons.star_border,
                                                          size: 14.r(context),
                                                          color: isFilled || isHalfFilled ? Colors.amber : Colors.grey.shade600,
                                                        );
                                                      }),
                                                    ),
                                                    SizedBox(width: 5.w(context)),
                                                    CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                      plainTextString: storesResponseModel.value.data!.data![index].ratings.toStringAsFixed(1).toString(),
                                                      plainTextStringFontSize: 14.sp(context),
                                                      plainTextStringFontWeight: FontWeight.w600,
                                                      plainTextContainerAlignment: Alignment.center,
                                                      plainTextStringColor: AppColors.black29,
                                                      plainTextStringTextAlign: TextAlign.start,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 6.h(context)),



                                            // Description Text

                                            CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                              plainTextString: storesResponseModel.value.data!.data![index].description != null ?
                                              "${storesResponseModel.value.data!.data![index].description.toString().length > 50 ?
                                              storesResponseModel.value.data!.data![index].description.toString().substring(0,50) :
                                              storesResponseModel.value.data!.data![index].description.toString()}...." : "N/A",
                                              plainTextStringFontSize: 14.sp(context),
                                              plainTextStringFontWeight: FontWeight.w700,
                                              plainTextContainerAlignment: Alignment.centerLeft,
                                              plainTextStringColor:  AppColors.blackColor,
                                              plainTextStringTextAlign: TextAlign.start,
                                            ),


                                            SizedBox(height: 6.h(context)),

                                            // Location
                                            FutureBuilder(
                                                future: _getAddressFromLatLng(storesResponseModel.value.data!.data![index].location!.coordinates!.last,
                                                    storesResponseModel.value.data!.data![index].location!.coordinates!.first),
                                                builder: (context, snapshot) {
                                                  return Row(
                                                    children: [
                                                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                                                      SizedBox(width: 5.w(context)),
                                                      Expanded(
                                                        child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                                          plainTextString: "${snapshot.data}",
                                                          plainTextStringFontSize: 14.sp(context),
                                                          plainTextStringFontWeight: FontWeight.w600,
                                                          plainTextContainerAlignment: Alignment.centerLeft,
                                                          plainTextStringColor: AppColors.blackColor,
                                                          plainTextStringTextAlign: TextAlign.start,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ) :
                      Container(
                        height: 156.h(context),
                        width: 428.w(context),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),


                      CustomSpaceWidget.spacerWidget(spaceHeight: 15.h(context)),

                    ],
                  )
                ),
              )


            ],
          ),
        ),
      )),
    );
  }




}

Widget _buildScalingTransition(String image, int index) {
  return TweenAnimationBuilder(
    tween: Tween<double>(begin: 0.8, end: 1.0), // Scaling from 50% to 100%
    duration: const Duration(milliseconds: 600),
    builder: (context, double scale, child) {
      return Transform.scale(
        scale: scale, // Scale the image
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      );
    },
  );
}