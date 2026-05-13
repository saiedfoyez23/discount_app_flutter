import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController(context: context));
    return Scaffold(
      body: Container(
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
            enabled: cartController.isLoading.value,
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [


                SliverFillRemaining(
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.hpm(context)),
                        child: Column(
                          children: [


                            SpaceHelperWidget.v(20.h(context)),

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


                                        ImageHelperWidget.circleImageHelperWidget(
                                          width: 45,
                                          height: 45,
                                          verticalPadding: 1,
                                          horizontalPadding: 1,
                                          backgroundColor: ColorUtils.orange213,
                                          radius: 25,
                                          context: context,
                                          imageAsset: cartController.userProfileResponseModel.value.data?.image ==  null ? ImageUtils.noImage : null,
                                          imageUrl: cartController.userProfileResponseModel.value.data?.image,
                                        ),

                                        SpaceHelperWidget.h(20.w(context)),

                                        Expanded(
                                          child: Center(
                                            child: ImageHelperWidget.assetImageWidget(
                                              context: context,
                                              height: 64.h(context),
                                              width: 170.w(context),
                                              imageString: ImageUtils.discountMeLogo,
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),

                                  SpaceHelperWidget.h(5.w(context)),


                                  InkWell(
                                    onTap: () {
                                      Get.off(()=>UserNotificationView(),preventDuplicates: false,duration: const Duration(milliseconds: 100));
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

                                ],
                              ),
                            ),


                            SpaceHelperWidget.v(20.h(context)),



                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                TextHelperClass.headingTextWithoutWidth(
                                  context: context,
                                  alignment: Alignment.centerLeft,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  textColor: ColorUtils.black29,
                                  text: "Order details",
                                ),


                                ButtonHelperWidget.customIconButtonWidget(
                                    context: context,
                                    onPressed: onPressed,
                                    iconPath: iconPath,
                                )


                                Container(
                                  height: 45.h(context),
                                  width: 130.w(context),
                                  padding: EdgeInsets.symmetric(horizontal: 10.hpm(context), vertical: 5.vpm(context)),
                                  decoration: BoxDecoration(
                                    color: ColorUtils.secondaryColor,
                                    borderRadius: BorderRadius.circular(5.r(context)),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      Get.off(()=>UserDashboardView(index: 2,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                    },
                                    child: Row(
                                      children: [
                                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                          plainTextString: "Add More",
                                          plainTextStringFontSize: 18.sp(context),
                                          plainTextStringFontWeight: FontWeight.w600,
                                          plainTextContainerAlignment: Alignment.centerLeft,
                                          plainTextStringColor: ColorUtils.white253,
                                          plainTextStringTextAlign: TextAlign.start,
                                        ),
                                        CustomSpaceWidget.spacerWidget(spaceWidth: 10.w(context)),

                                        Icon(
                                          Icons.add,
                                          size: 18.r(context),
                                          color: ColorUtils.whiteColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),
                          ],
                        ),
                      ),


                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.hpm(context),vertical: 0.vpm(context)),
                          itemCount: getAllProductCartResponse.value.data?.carts?.length,
                          itemBuilder: (context, index) {
                            return Obx(()=>Container(
                              padding: EdgeInsets.all(8.w(context)),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r(context)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.07),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  getAllProductCartResponse.value.data?.carts?[index].product?.images?.isEmpty == true ||
                                      getAllProductCartResponse.value.data?.carts?[index].product?.images == null ?
                                  Container(
                                    height: 120.h(context),
                                    width: 100.w(context),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ImageUtils.carousel1),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8.r(context)),
                                      color: Color.fromRGBO(175, 175, 175, 1),
                                    ),
                                  ) :
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r(context)),
                                    child: CustomImageContainer.networkImageContainer(
                                      height: 120.h(context),
                                      width: 100.w(context),
                                      networkImage: getAllProductCartResponse.value.data!.carts![index].product!.images!.first,
                                      boxFit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 12.w(context)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                          plainTextString: getAllProductCartResponse.value.data?.carts?[index].product?.name ?? "N/A",
                                          plainTextStringFontSize: 17.sp(context),
                                          plainTextStringFontWeight: FontWeight.w600,
                                          plainTextContainerAlignment: Alignment.centerLeft,
                                          plainTextStringColor: ColorUtils.black29,
                                          plainTextStringTextAlign: TextAlign.start,
                                        ),
                                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                          plainTextString: storesResponseModel.value.data?.data?.where((e)=> e.sId == getAllProductCartResponse.value.data?.carts?[index].product?.store?.sId).first.name ?? "N/A",
                                          plainTextStringFontSize: 14.sp(context),
                                          plainTextStringFontWeight: FontWeight.w400,
                                          plainTextContainerAlignment: Alignment.centerLeft,
                                          plainTextStringColor: ColorUtils.black29,
                                          plainTextStringTextAlign: TextAlign.start,
                                        ),
                                        CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                          plainTextString: "Rs ${getAllProductCartResponse.value.data?.carts?[index].subtotal.toString() ?? "N/A"}",
                                          plainTextStringFontSize: 21.sp(context),
                                          plainTextStringFontWeight: FontWeight.w700,
                                          plainTextContainerAlignment: Alignment.centerLeft,
                                          plainTextStringColor: ColorUtils.primaryColor,
                                          plainTextStringTextAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Quantity Selector
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 32.h(context),
                                            width: 32.w(context),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.r(context)),
                                              color: ColorUtils.greenLightHover,
                                            ),
                                            child: getAllProductCartResponse.value.data?.carts?[index].sId == productId.value && isDecrease.value == true ?
                                            Center(
                                              child: CircularProgressIndicator(),
                                            ) :
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              icon: Icon(
                                                Icons.remove,
                                                color: ColorUtils.primaryColor,
                                              ),
                                              onPressed: isDecrease.value == true ? null : () async {
                                                isDecrease.value = true;
                                                subTotal.value = 0.0;
                                                productId.value = getAllProductCartResponse.value.data?.carts?[index].sId;
                                                await OrderController.decreaseCartItemResponse(
                                                  productId: getAllProductCartResponse.value.data?.carts?[index].sId,
                                                  onSuccess: (e) async {
                                                    await OrderController.addToCartResponse(
                                                      onSuccess: (e) {
                                                        getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(e);
                                                        getAllProductCartResponse.value.data?.carts?.forEach((e){
                                                          subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
                                                        });
                                                        productId.value = " ";
                                                        isDecrease.value = false;
                                                        print(subTotal.value);
                                                      },
                                                      onFail: (e) {
                                                        isDecrease.value = false;
                                                        CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                      },
                                                      onExceptionFail: (e) async {
                                                        if(e == "jwt expired") {
                                                          await AppLocalStorage.removeKey(key: "Login");
                                                          Get.off(()=>SignInView(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                                        }
                                                        isDecrease.value = false;
                                                        CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                      },
                                                    );
                                                  },
                                                  onFail: (e) {
                                                    isDecrease.value = false;
                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                  },
                                                  onExceptionFail: (e) async {
                                                    if(e == "jwt expired") {
                                                      await AppLocalStorage.removeKey(key: "Login");
                                                      Get.off(()=>SignInView(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                                    }
                                                    isLoading.value = false;
                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                  },
                                                );

                                              },
                                            ),
                                          ),
                                          SizedBox(width: 8.w(context)),
                                          CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                            plainTextString: getAllProductCartResponse.value.data?.carts?[index].quantity.toString() ?? "N/A",
                                            plainTextStringFontSize: 16.sp(context),
                                            plainTextStringFontWeight: FontWeight.w600,
                                            plainTextContainerAlignment: Alignment.center,
                                            plainTextStringColor: ColorUtils.black29,
                                            plainTextStringTextAlign: TextAlign.center,
                                          ),
                                          SizedBox(width: 8.w(context)),
                                          Container(
                                            height: 32.h(context),
                                            width: 32.w(context),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.r(context)),
                                              color: ColorUtils.primaryColor,
                                            ),
                                            child: getAllProductCartResponse.value.data?.carts?[index].sId == productId.value && isIncrease.value == true ?
                                            Center(
                                              child: CircularProgressIndicator(),
                                            ) :
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              icon: Icon(Icons.add, color: Colors.white),
                                              onPressed: isIncrease.value == true ? null : () async {
                                                isIncrease.value = true;
                                                subTotal.value = 0.0;
                                                productId.value = getAllProductCartResponse.value.data?.carts?[index].sId;
                                                await OrderController.increaseCartItemResponse(
                                                  productId: getAllProductCartResponse.value.data?.carts?[index].sId,
                                                  onSuccess: (e) async {
                                                    await OrderController.addToCartResponse(
                                                      onSuccess: (e) {
                                                        getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(e);
                                                        getAllProductCartResponse.value.data?.carts?.forEach((e){
                                                          subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
                                                        });
                                                        productId.value = " ";
                                                        isIncrease.value = false;
                                                        print(subTotal.value);
                                                      },
                                                      onFail: (e) {
                                                        isIncrease.value = false;
                                                        CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                      },
                                                      onExceptionFail: (e) async {
                                                        if(e == "jwt expired") {
                                                          await AppLocalStorage.removeKey(key: "Login");
                                                          Get.off(()=>SignInView(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                                        }
                                                        isIncrease.value = false;
                                                        CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                      },
                                                    );
                                                  },
                                                  onFail: (e) {
                                                    isDecrease.value = false;
                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                  },
                                                  onExceptionFail: (e) async {
                                                    if(e == "jwt expired") {
                                                      await AppLocalStorage.removeKey(key: "Login");
                                                      Get.off(()=>SignInView(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                                    }
                                                    isLoading.value = false;
                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 15.h(context)),

                                      Container(
                                        height: 32.h(context),
                                        width: 32.w(context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.r(context)),
                                          color: ColorUtils.greenLightHover,
                                        ),
                                        child: getAllProductCartResponse.value.data?.carts?[index].sId == productId.value && isDelete.value == true ?
                                        Center(
                                          child: CircularProgressIndicator(),
                                        ) :
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            Icons.delete_forever,
                                            color: ColorUtils.primaryColor,
                                          ),
                                          onPressed: isDelete.value == true ? null : () async {
                                            isDelete.value = true;
                                            subTotal.value = 0.0;
                                            productId.value = getAllProductCartResponse.value.data?.carts?[index].sId;
                                            await OrderController.deleteCartResponse(
                                              cardId: getAllProductCartResponse.value.data?.carts?[index].sId,
                                              onSuccess: (e) async {
                                                await OrderController.addToCartResponse(
                                                  onSuccess: (e) {
                                                    getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(e);
                                                    getAllProductCartResponse.value.data?.carts?.forEach((e){
                                                      subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
                                                    });
                                                    productId.value = " ";
                                                    isDelete.value = false;
                                                    print(subTotal.value);
                                                  },
                                                  onFail: (e) {
                                                    isDelete.value = false;
                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                  },
                                                  onExceptionFail: (e) async {
                                                    if(e == "jwt expired") {
                                                      await AppLocalStorage.removeKey(key: "Login");
                                                      Get.off(()=>SignInView(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                                    }
                                                    isDelete.value = false;
                                                    CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                                  },
                                                );
                                              },
                                              onFail: (e) {
                                                isDecrease.value = false;
                                                CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                              },
                                              onExceptionFail: (e) async {
                                                if(e == "jwt expired") {
                                                  await AppLocalStorage.removeKey(key: "Login");
                                                  Get.off(()=>SignInView(),preventDuplicates: false,duration: Duration(milliseconds: 100));
                                                }
                                                isLoading.value = false;
                                                CustomSnackBar().errorCustomSnackBar(context: context, message: "${e}");
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                          },
                        ),
                      ),



                      // Discount Voucher Section
                      Padding(padding: EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 0.5)
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  title: 'Purchase Coupon Card ',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  /*Get.to(
                                  ()=>QrScannerScreen(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 500)
                          );*/
                                },
                                child: CustomText(title: 'Redeem', fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500,),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorUtils.secondaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      Container(
                        width: 428.w(context),
                        padding: EdgeInsets.symmetric(vertical: 16.vpm(context), horizontal: 20.hpm(context)),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.r(context)),
                          image: DecorationImage(
                            image: AssetImage(ImageUtils.orderBg),
                            fit: BoxFit.cover,
                            opacity: 0.3,
                            colorFilter: ColorFilter.mode(
                                ColorUtils.primaryColor, BlendMode.dstATop),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: 'Sub-Total',
                                  plainTextStringFontSize: 16.sp(context),
                                  plainTextStringFontWeight: FontWeight.w500,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: "Rs ${subTotal.floor()}",
                                  plainTextStringFontSize: 16.sp(context),
                                  plainTextStringFontWeight: FontWeight.w500,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: 'Delivery Charge',
                                  plainTextStringFontSize: 16.sp(context),
                                  plainTextStringFontWeight: FontWeight.w500,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: "Rs ${getAllProductCartResponse.value.data?.totalShippingFee.toString() ?? "N/A"}",
                                  plainTextStringFontSize: 16.sp(context),
                                  plainTextStringFontWeight: FontWeight.w500,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: 'Discount',
                                  plainTextStringFontSize: 16.sp(context),
                                  plainTextStringFontWeight: FontWeight.w500,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: "Rs ${getAllProductCartResponse.value.data?.totalShippingFee.toString() ?? "0"}",
                                  plainTextStringFontSize: 16.sp(context),
                                  plainTextStringFontWeight: FontWeight.w500,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: 'Total',
                                  plainTextStringFontSize: 20.sp(context),
                                  plainTextStringFontWeight: FontWeight.w800,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),

                                CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                  plainTextString: "Rs ${double.parse(getAllProductCartResponse.value.data?.totalShippingFee.toString() ?? "0") + double.parse(subTotal.value.toString())}",
                                  plainTextStringFontSize: 16.sp(context),
                                  plainTextStringFontWeight: FontWeight.w800,
                                  plainTextContainerAlignment: Alignment.centerLeft,
                                  plainTextStringColor: Color(0xfffefeff),
                                  plainTextStringTextAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Roundbutton(
                                title: "Place My Order",
                                titleColor: ColorUtils.primaryColor,
                                borderRadius: 8.r(context),
                                buttonColor: ColorUtils.whiteColor,
                                onTap: () {
                                  if(getAllProductCartResponse.value.data?.carts?.isEmpty == true) {
                                    CustomSnackBar().errorCustomSnackBar(context: context, message: "Please Add At least 1 Product to Cart");
                                  } else {
                                    Get.off(()=>OrderPickLocationView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
                                  }
                                  //Get.to(OrderCompleteScreen());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                )

              ],
            )
        )),
      ),
    );
  }
}
