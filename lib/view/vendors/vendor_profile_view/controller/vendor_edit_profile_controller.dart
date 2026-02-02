import 'dart:convert';
import 'dart:io';
import 'package:discount_me_app/view/vendors/vendor_profile_view/model/vendor_profile_response_model.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../res/res.dart';
import '../../../../utils/utils.dart';

class VendorEditProfileController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool isSubmit = false.obs;
  Rx<VendorProfileResponseModel> vendorProfileResponseModel = VendorProfileResponseModel().obs;
  Rx<TextEditingController> restaurantName = TextEditingController().obs;
  Rx<TextEditingController> restaurantDescription = TextEditingController().obs;
  Rx<TextEditingController> emailAddress = TextEditingController().obs;
  Rx<TextEditingController> locationAddress = TextEditingController().obs;
  Rx<String> restaurantContact = "".obs;
  Rx<File> textDocumentFile = File("").obs;
  Rx<File> coverFile = File("").obs;
  RxString textDocument = "".obs;
  RxString coverDocument = "".obs;
  BuildContext context;
  VendorEditProfileController({required this.context});

  GoogleMapController? mapController;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    Future.delayed(Duration(seconds: 1),() async {
      await vendorPickLocationPlaceLatLng();
      await getVendorProfileController(context: context);
    });
  }


  /// Check & request permission
  static Future<void> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permission permanently denied';
    }
  }

  /// Get current position
  static Future<Position> getCurrentPosition() async {
    await _handlePermission();
    return await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.best));
  }

  /// Get address from latitude & longitude
  Future<void> vendorPickLocationPlaceLatLng() async {
    await getCurrentPosition().then((position) async {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;
      locationAddress.value.text = "${place.street} ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}";
    });
  }


  Future<void> getVendorProfileController({
    required BuildContext context,
  }) async {

    String accessToken = "";
    await AppLocalStorage.getString(key: "Login").then((value) {
      accessToken = jsonDecode(value!)["data"]["accessToken"];
    });
    print(accessToken);

    BaseApiUtils.get(
      url: ApiUtils.vendorsProfile,
      authorization: accessToken,
      onSuccess: (e,data) async {
        isLoading.value = false;
        vendorProfileResponseModel.value = VendorProfileResponseModel.fromJson(data);
        restaurantName.value.text = vendorProfileResponseModel.value.data?.store?.name ?? "";
        restaurantDescription.value.text = vendorProfileResponseModel.value.data?.balance.toString() ?? "";
        emailAddress.value.text = vendorProfileResponseModel.value.data?.email ?? "";
        restaurantContact.value = vendorProfileResponseModel.value.data?.contact ?? "";
        textDocument.value = vendorProfileResponseModel.value.data?.taxDocument ?? "";
        coverDocument.value = vendorProfileResponseModel.value.data?.store?.coverImages?.isEmpty == true ?
        "" : vendorProfileResponseModel.value.data!.store!.coverImages!.first;
      },
      onFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
      onExceptionFail: (e,data) {
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: e);
        isLoading.value = false;
      },
    );

  }


}