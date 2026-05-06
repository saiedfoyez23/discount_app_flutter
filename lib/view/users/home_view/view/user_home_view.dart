import 'package:discount_me_app/res/common_widget/RoundTextField.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UserHomeView extends StatelessWidget {
  UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserHomeController userHomeController = Get.put(UserHomeController(context: context));
    return Scaffold(
      body: Container(
        height: 926.h(context),
        width: 428.w(context),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(ImageUtils.homeBg),
            alignment: Alignment.topRight,
            opacity: 0.5,
          ),
        ),
        child: Obx(()=>Skeletonizer(
          effect: PulseEffect(),
          enabled: userHomeController.isLoading.value,
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

                          SpaceHelperWidget.v(40.h(context)),

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

                                      userHomeController.userProfileResponseModel.value.data?.image == null ?
                                      Container(
                                        width: 40.w(context),
                                        height: 40.h(context),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.lightBlueAccent,
                                            image: DecorationImage(
                                              image: AssetImage(ImageUtils.homeProfileAvatar),
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
                                              image: NetworkImage(userHomeController.userProfileResponseModel.value.data!.image),
                                              fit: BoxFit.fitHeight,
                                            )
                                        ),
                                      ),

                                      SpaceHelperWidget.h(20.w(context)),

                                      Icon(Icons.location_on, size: 16.r(context),),


                                      SpaceHelperWidget.h(5.w(context)),

                                      Expanded(
                                        child: TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          text: userHomeController.userProfileResponseModel.value.data?.location ?? "N/A",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          alignment: Alignment.centerLeft,
                                          textColor: ColorUtils.black29,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                Row(
                                  children: [

                                    InkWell(
                                      onTap: () {
                                        Get.off(()=>UserNotificationView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                      },
                                      child: Container(
                                        width: 45.w(context),
                                        height: 45.h(context),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.primaryColor,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: ColorUtils.whiteColor,
                                              blurRadius: 10,
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Icon(Icons.notifications, color: ColorUtils.whiteColor, size: 25.r(context),),
                                      ),
                                    ),

                                    SpaceHelperWidget.h(6.w(context)),


                                    InkWell(
                                      onTap: () {
                                        Get.off(()=>OrderScreen(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                      },
                                      child: Container(
                                        width: 45.w(context),
                                        height: 45.h(context),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorUtils.primaryColor,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: ColorUtils.whiteColor,
                                              blurRadius: 10,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Icon(Icons.shopping_cart, color: ColorUtils.whiteColor,size: 22.r(context),),
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),


                          SpaceHelperWidget.v(15.h(context)),


                          //======================Search Section================================
                          RoundTextField(
                            hint: "Search",
                            prefixIcon: Icon(Icons.search_outlined),
                            onTap: () async {
                              Get.off(ProductListScreen(categoryId: "",storeId: "",),preventDuplicates: false,duration: Duration(milliseconds: 100));
                            },
                          ),


                          SpaceHelperWidget.v(20.h(context)),


                          Container(
                            height: 250.h(context),
                            width: 428.w(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: userHomeController.imageList.isNotEmpty == true ?
                            Column(
                              children: [
                                Expanded(
                                  child: PageView.builder(
                                    onPageChanged: (value) {
                                      userHomeController.onPageChanged(value);
                                    },
                                    controller: userHomeController.pageController.value,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: userHomeController.imageList.length,
                                    itemBuilder: (context, index) {
                                      return _buildScalingTransition(userHomeController.imageList[index], index);
                                    },
                                  ),
                                ),
                                SpaceHelperWidget.v(10.h(context)),
                                SmoothPageIndicator(
                                  controller: userHomeController.pageController.value,
                                  count: userHomeController.imageList.length,
                                  effect: ExpandingDotsEffect(
                                    activeDotColor: Colors.deepPurple,
                                    dotColor: Colors.deepPurple.shade100,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                  ),
                                ),
                              ],
                            ) : SizedBox.shrink(),
                          ),


                          SpaceHelperWidget.v(20.h(context)),

                          userHomeController.categoriesResponseModel.value.categories?.isNotEmpty == true ||
                              userHomeController.categoriesResponseModel.value.categories != null ?
                          Container(
                            height: 120.h(context),
                            width: 428.w(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: userHomeController.categoriesResponseModel.value.categories?.length,
                              padding: EdgeInsets.all(5.r(context)),
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Obx(()=>Container(
                                  height: 90.h(context),
                                  width: 90.w(context),
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
                                    borderRadius: BorderRadius.circular(8.r(context)),
                                  ),
                                  margin: EdgeInsets.only(right: 10.rpm(context)),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.hpm(context),
                                        vertical: 10.vpm(context),
                                      ),
                                    ),
                                    onPressed: () async {
                                      Get.off(()=>ProductListScreen(categoryId: userHomeController.categoriesResponseModel.value.categories![index].sId,storeId: "",),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ImageHelperWidget.styledImage(
                                          context: context,
                                          height: 50.h(context),
                                          width: 50.w(context),
                                          borderRadius: 0,
                                          imageUrl: userHomeController.categoriesResponseModel.value.categories?[index].icon,
                                        ),

                                        SpaceHelperWidget.v(6.h(context)),

                                        TextHelperClass.headingTextWithoutWidth(
                                          context: context,
                                          text: userHomeController.categoriesResponseModel.value.categories?[index].name,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          textColor: ColorUtils.black29,
                                          textAlign: TextAlign.center,
                                          alignment: Alignment.center,
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

                          SpaceHelperWidget.v(20.h(context)),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                text: "Popular Products",
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                textColor: ColorUtils.black29,
                                textAlign: TextAlign.start,
                                alignment: Alignment.centerLeft,
                              ),


                              ButtonHelperWidget.customButtonWidget(
                                context: context,
                                onPressed: () async {
                                  Get.off(()=>ProductListScreen(categoryId: "",storeId: "",),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                },
                                text: "See all",
                                padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                                alignment: Alignment.centerRight,
                                fontSize: 18,
                                textColor: ColorUtils.primaryColor,
                                fontWeight: FontWeight.w500,
                                backgroundColor: Colors.transparent,
                              ),


                            ],
                          ),

                          SpaceHelperWidget.v(10.h(context)),


                          userHomeController.productsResponseModel.value.data?.data?.isNotEmpty == true || userHomeController.productsResponseModel.value.data?.data != null ?
                          Container(
                            height: 320.h(context),
                            width: 428.w(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ListView.builder(
                              itemCount: userHomeController.productsResponseModel.value.data?.data?.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Obx(()=>Stack(
                                  children: [

                                    TextButton(
                                      onPressed: () async {
                                        Get.off(SingleProductViewScreen(
                                          productId: userHomeController.productsResponseModel.value.data!.data![index].sId,
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
                                            userHomeController.productsResponseModel.value.data?.data?[index].images?.isEmpty == true ?
                                            Container(
                                              height: 140.h(context),
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(ImageUtils.carousel1),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius: BorderRadius.vertical(top: Radius.circular(15.r(context))),
                                                color: Color.fromRGBO(175, 175, 175, 1),
                                              ),
                                            ) :
                                            ClipRRect(
                                              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r(context))),
                                              child: Image.network(
                                                userHomeController.productsResponseModel.value.data!.data![index].images!.first, // Replace with your image path
                                                height: 140.h(context),
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                  return Container(
                                                    height: 140.h(context),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(ImageUtils.carousel1),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius: BorderRadius.vertical(top: Radius.circular(15.r(context))),
                                                      color: Color.fromRGBO(175, 175, 175, 1),
                                                    ),
                                                  );
                                                },
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

                                                  TextHelperClass.headingTextWithoutWidth(
                                                    context: context,
                                                    text: userHomeController.productsResponseModel.value.data?.data?[index].name ?? "N/A",
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                    textColor: ColorUtils.black29,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    alignment: Alignment.centerLeft,
                                                    textOverFlow: TextOverflow.ellipsis,
                                                  ),


                                                  SpaceHelperWidget.v(5.h(context)),


                                                  TextHelperClass.headingTextWithoutWidth(
                                                    context: context,
                                                    text: userHomeController.productsResponseModel.value.data?.data?[index].description ?? "N/A",
                                                    fontSize: 16,
                                                    maxLines: 3,
                                                    fontWeight: FontWeight.w700,
                                                    textColor: ColorUtils.black76,
                                                    textAlign: TextAlign.start,
                                                    alignment: Alignment.centerLeft,
                                                    textOverFlow: TextOverflow.ellipsis,
                                                  ),


                                                  SpaceHelperWidget.v(10.h(context)),


                                                  // Bottom section with icons, labels, and price
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      // Icons with labels (Time estimate and rating)
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            // Time icon and label
                                                            Icon(Icons.ac_unit, size: 16.r(context), color: ColorUtils.yellow136),

                                                            SpaceHelperWidget.h(6.w(context)),

                                                            TextHelperClass.headingTextWithoutWidth(
                                                              context: context,
                                                              text: userHomeController.productsResponseModel.value.data?.data?[index].quantity != null ?
                                                              "${userHomeController.productsResponseModel.value.data?.data?[index].quantity} pics" : "N/A",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                              textColor: ColorUtils.black76,
                                                              textAlign: TextAlign.start,
                                                              alignment: Alignment.centerLeft,
                                                            ),


                                                            SpaceHelperWidget.h(10.w(context)),


                                                            // Rating icon and label
                                                            Icon(Icons.star, size: 16.r(context), color: ColorUtils.yellow136),
                                                            SpaceHelperWidget.h(6.w(context)),

                                                            TextHelperClass.headingTextWithoutWidth(
                                                              context: context,
                                                              text: userHomeController.productsResponseModel.value.data?.data?[index].ratings != null ?
                                                              "${userHomeController.productsResponseModel.value.data?.data?[index].ratings}" : "N/A",
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500,
                                                              textColor: ColorUtils.black76,
                                                              textAlign: TextAlign.start,
                                                              alignment: Alignment.centerLeft,
                                                            ),


                                                          ],
                                                        ),
                                                      ),


                                                      TextHelperClass.headingTextWithoutWidth(
                                                        context: context,
                                                        text: userHomeController.productsResponseModel.value.data?.data?[index].price != null ?
                                                        "${"\$"}${userHomeController.productsResponseModel.value.data!.data![index].price.toString()}" : "N/A",
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.w700,
                                                        textColor: ColorUtils.black29,
                                                        textAlign: TextAlign.start,
                                                        alignment: Alignment.centerLeft,
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
                                      child: userHomeController.selectProductId.value == userHomeController.productsResponseModel.value.data?.data?[index].sId &&
                                          userHomeController.isAdd.value == true ?
                                      LoadingHelperWidget.loadingHelperWithoutHeightWidget(
                                        context: context,
                                      ) :
                                      ButtonHelperWidget.customButtonWidget(
                                        height: 40,
                                        context: context,
                                        onPressed: () async {
                                          userHomeController.selectProductId.value = userHomeController.productsResponseModel.value.data?.data?[index].sId;
                                          userHomeController.isAdd.value = true;
                                          Map<String,dynamic> data = {
                                            "product": userHomeController.productsResponseModel.value.data?.data?[index].sId,
                                            "quantity": 1,
                                          };
                                          print(data);
                                          await userHomeController.addProductToCartResponse(
                                            data: data,
                                            context: context,
                                          );
                                        },
                                        text: "Add To Cart",
                                        textColor: ColorUtils.black29,
                                        alignment: Alignment.center,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        backgroundColor: ColorUtils.white246,
                                        borderRadius: 12,
                                        padding: EdgeInsets.symmetric(horizontal: 15.hpm(context)),
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
                          SpaceHelperWidget.v(20.h(context)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              TextHelperClass.headingTextWithoutWidth(
                                context: context,
                                text: "Popular Stores",
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                textColor: ColorUtils.black29,
                                textAlign: TextAlign.start,
                                alignment: Alignment.centerLeft,
                              ),

                              ButtonHelperWidget.customButtonWidget(
                                context: context,
                                onPressed: () async {
                                  Get.off(()=>StoreListViewScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                },
                                text: "See all",
                                padding: EdgeInsets.symmetric(vertical: 14.5.vpm(context)),
                                alignment: Alignment.centerRight,
                                fontSize: 18,
                                textColor: ColorUtils.primaryColor,
                                fontWeight: FontWeight.w500,
                                backgroundColor: Colors.transparent,
                              ),



                              // Container(
                              //   height: 30.h(context),
                              //   padding: EdgeInsets.symmetric(horizontal: 15.hpm(context), vertical: 5.vpm(context)),
                              //   decoration: BoxDecoration(
                              //     color: ColorUtils.orangeLight,
                              //     borderRadius: BorderRadius.circular(50.r(context)),
                              //   ),
                              //   child: TextButton(
                              //     style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              //     onPressed: () {
                              //
                              //       //Get.to(ResturantListScreen());
                              //     },
                              //     child: CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                              //       plainTextString: "See all",
                              //       plainTextStringFontSize: 14.sp(context),
                              //       plainTextStringFontWeight: FontWeight.w400,
                              //       plainTextContainerAlignment: Alignment.center,
                              //       plainTextStringColor: ColorUtils.secondaryColor,
                              //       plainTextStringTextAlign: TextAlign.center,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),

                          userHomeController.storesResponseModel.value.data?.data?.isNotEmpty == true ||
                              userHomeController.storesResponseModel.value.data?.data != null ?
                          Container(
                            height: 200.h(context),
                            width: 428.w(context),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: userHomeController.storesResponseModel.value.data?.data?.length,
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
                                        storeId: userHomeController.storesResponseModel.value.data!.data![index].sId,
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
                                              userHomeController.storesResponseModel.value.data!.data![index].coverImages!.first,
                                              height: 180.h(context),
                                              width: 90.w(context),
                                              fit: BoxFit.cover,
                                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                                return Container(
                                                  height: 180.h(context),
                                                  width: 90.w(context),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(ImageUtils.carousel1),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius: BorderRadius.circular(5.r(context)),
                                                    color: Color.fromRGBO(175, 175, 175, 1),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),

                                          SpaceHelperWidget.h(10.w(context)),


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
                                                      child: TextHelperClass.headingTextWithoutWidth(
                                                        context: context,
                                                        text: userHomeController.storesResponseModel.value.data?.data?[index].name ?? "",
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w700,
                                                        textColor: ColorUtils.black29,
                                                        textAlign: TextAlign.start,
                                                        alignment: Alignment.centerLeft,
                                                      ),
                                                    ),

                                                    SpaceHelperWidget.h(5.w(context)),

                                                    // Rating
                                                    Row(
                                                      children: [
                                                        Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: List.generate(5, (Index) {
                                                            // Calculate the fill amount for each star
                                                            double starValue = double.parse(userHomeController.storesResponseModel.value.data!.data![index].ratings.toString()) - Index;
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


                                                        SpaceHelperWidget.h(5.w(context)),

                                                        TextHelperClass.headingTextWithoutWidth(
                                                          context: context,
                                                          text: userHomeController.storesResponseModel.value.data!.data![index].ratings.toStringAsFixed(1).toString(),
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                          textColor: ColorUtils.black29,
                                                          textAlign: TextAlign.start,
                                                          alignment: Alignment.center,
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                ),


                                                SpaceHelperWidget.v(6.h(context)),


                                                TextHelperClass.headingTextWithoutWidth(
                                                  context: context,
                                                  text: userHomeController.storesResponseModel.value.data?.data?[index].description ?? "",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  textColor: ColorUtils.blackColor,
                                                  textAlign: TextAlign.start,
                                                  alignment: Alignment.centerLeft,
                                                  maxLines: 2,
                                                  textOverFlow: TextOverflow.ellipsis
                                                ),


                                                SpaceHelperWidget.v(6.h(context)),

                                                // Location
                                                FutureBuilder(
                                                    future: userHomeController.getAddressFromLatLng(userHomeController.storesResponseModel.value.data!.data![index].location!.coordinates!.last,
                                                        userHomeController.storesResponseModel.value.data!.data![index].location!.coordinates!.first),
                                                    builder: (context, snapshot) {
                                                      return Row(
                                                        children: [

                                                          Icon(Icons.location_on, color: Colors.grey, size: 16.r(context)),

                                                          SpaceHelperWidget.v(6.h(context)),

                                                          Expanded(
                                                            child: TextHelperClass.headingTextWithoutWidth(
                                                              context: context,
                                                              text: "${snapshot.data}",
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.w600,
                                                              textColor: ColorUtils.blackColor,
                                                              textAlign: TextAlign.start,
                                                              alignment: Alignment.centerLeft,
                                                              maxLines: 1,
                                                              textOverFlow: TextOverflow.ellipsis,
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


                          SpaceHelperWidget.v(56.h(context)),

                        ],
                      )
                  ),
                )


              ],
            ),
          ),
        )),
      ),
    );
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


}
