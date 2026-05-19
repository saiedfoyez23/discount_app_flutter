import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/utils/utils.dart';

class UserStoreListController extends GetxController {


  Rx<StoresResponseModel> storesResponseModel = StoresResponseModel().obs;
  Rx<UserProfileResponseModel> userProfileResponseModel = UserProfileResponseModel().obs;

  RxBool isLoading = false.obs;
  BuildContext context;
  RxList<Stores> stores = <Stores>[].obs;
  UserStoreListController({required this.context});
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;

  Future<void> determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat.value = position.latitude;
    long.value = position.longitude;
    print(lat.value);
    print(long.value);
  }

  Future<String> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      Placemark place = placemarks[0];
      return "${place.street}, ${place.locality}, ${place.subAdministrativeArea},${place.administrativeArea}, ${place.country}";
    } catch (e) {
      return "Place in not found";
    }
  }



  Future<void> checkLocationPermission() async {
    Future.delayed(const Duration(milliseconds: 500),() async {
      LocationPermission permission;
      var checkPermission = await Geolocator.checkPermission();
      permission = await Geolocator.requestPermission();
      print(permission);
      if(permission == LocationPermission.denied) {
        await checkLocationPermission();
      }else if(permission == LocationPermission.deniedForever){
        MessageSnackBarWidget.errorSnackBarWidget(context: context, message: "Location Permission need.Please go to app setting or unInstall the app");
      }else {
        await determinePosition();
      }
    });
  }



}