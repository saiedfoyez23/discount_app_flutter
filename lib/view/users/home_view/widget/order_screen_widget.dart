import 'package:discount_me_app/res/common_widget/custom_text.dart';
import 'package:discount_me_app/view/users/home_view/view/order_select_address_view.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:discount_me_app/utils/utils.dart';
import '../../../../res/common_widget/RoundButton.dart';
import '../../../../res/res.dart';
import '../../profile_view/view/user_notification_screen.dart';
import '../view/order_complete_screen.dart';

class OrderScreenWidget extends GetxController {
  
  Rx<GetAllProductCartResponse> getAllProductCartResponse = GetAllProductCartResponse().obs;
  Rx<StoresResponseModel> storesResponseModel = StoresResponseModel().obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;
  RxBool isLoading = false.obs;
  RxBool isDelete = false.obs;
  RxBool isIncrease = false.obs;
  RxBool isDecrease = false.obs;
  RxString productId = "".obs;
  RxString cardId = "".obs;
  RxDouble subTotal = 0.0.obs;
  BuildContext context;

  OrderScreenWidget({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await OrderController.addToCartResponse(
        onSuccess: (e) {
          getAllProductCartResponse.value = GetAllProductCartResponse.fromJson(e);
          getAllProductCartResponse.value.data?.carts?.forEach((e){
            subTotal.value = subTotal.value + double.parse(e.subtotal.toString());
          });
          print(subTotal.value);
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
        },
      );
      await StoreListViewController.getStoriesApiService(
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
    });
  }


  Widget orderScreenWidget() {
    return Container(
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
          enabled: isLoading.value,
          child: CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [


              SliverFillRemaining(
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.hpm(context), vertical: 16.vpm(context)),
                      child: Column(
                        children: [

                          CustomSpaceWidget.spacerWidget(spaceHeight: 40.h(context)),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [

                                    userProfileResponseModel.value.data?.image == null ?
                                    Container(
                                      width: 45.w(context),
                                      height: 45.h(context),
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
                                      width: 45.w(context),
                                      height: 45.h(context),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.lightBlueAccent,
                                          image: DecorationImage(
                                            image: NetworkImage(userProfileResponseModel.value.data!.image),
                                            fit: BoxFit.fitHeight,
                                          )
                                      ),
                                    ),


                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          ImageUtils.discountMeLogo,
                                          scale: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 45.w(context),
                                height: 45.h(context),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.primaryColor,
                                    boxShadow: const [
                                      BoxShadow(color: ColorUtils.whiteColor,
                                          blurRadius: 10, offset: Offset(0, 1))
                                    ]
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    Get.off(()=>UserNotificationScreen(),preventDuplicates: false,duration: const Duration(milliseconds: 100));
                                  },
                                  child: Icon(
                                    Icons.notifications,
                                    color: ColorUtils.whiteColor,
                                    size: 25.r(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          CustomSpaceWidget.spacerWidget(spaceHeight: 20.h(context)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              CustomTextContainer.plainTextContainerWidgetWithoutHeightWidth(
                                plainTextString: "Order details",
                                plainTextStringFontSize: 20.sp(context),
                                plainTextStringFontWeight: FontWeight.w700,
                                plainTextContainerAlignment: Alignment.centerLeft,
                                plainTextStringColor: ColorUtils.black29,
                                plainTextStringTextAlign: TextAlign.start,
                              ),

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
                                    Get.off(()=>UserHome(selectedIndex: 2,),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
                                                        Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
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
                                                    Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
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
                                                        Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
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
                                                    Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
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
                                                    Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
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
                                                Get.off(()=>SignInScreen(),preventDuplicates: false,duration: Duration(milliseconds: 100));
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
                                Get.off(()=>OrderSelectAddressView(),duration: const Duration(milliseconds: 100),preventDuplicates: false);
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
    );
  }




}