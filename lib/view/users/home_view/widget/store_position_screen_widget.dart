import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../res/res.dart';

class StorePositionScreenWidget extends GetxController {

  final double lat;
  final double long;
  GoogleMapController? googleMapController;

  RxDouble updatedLat = 0.0.obs;
  RxDouble updatedLong = 0.0.obs;
  final BuildContext context;

  StorePositionScreenWidget({required this.long,required this.lat,required this.context});

  Future<Position> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }


  Future<void> updateCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(lat, long),
              zoom: 19.151926040649414
          ),
        ),
      );

      updatedLat.value = position.latitude;
      updatedLong.value = position.longitude;

      print(updatedLong.value);
      print(updatedLat.value);

    } catch (e) {
      // Handle exceptions
    }
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
        await _determinePosition();
        await updateCurrentLocation();
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 1),() async {
      await checkLocationPermission();
    });
  }

  Widget storePositionScreenWidget({required BuildContext context}) {
    return Container(
      height: 926.h(context),
      width: 428.w(context),
      decoration: BoxDecoration(
        color: AppColors.white246,
      ),
      child: ClipRRect(
        child: GoogleMap(
          initialCameraPosition: const CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(37.42796133580664, -122.085749655962),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414
          ),
          markers: {
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(lat, long),
            )
          },
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
      ),
    );
  }








}