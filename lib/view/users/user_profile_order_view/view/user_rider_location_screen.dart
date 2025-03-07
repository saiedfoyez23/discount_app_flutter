// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:async';
import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/res/common_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserRiderLocationScreen extends StatefulWidget {
  const UserRiderLocationScreen({super.key});

  @override
  State<UserRiderLocationScreen> createState() => _UserRiderLocationScreenState();
}

class _UserRiderLocationScreenState extends State<UserRiderLocationScreen> {

  final Completer<GoogleMapController> _controller=Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.8103, 90.4125),
    zoom: 13.0,
  );
  Set<Marker> _marker = {};

  // Define the circle centered on the Dhaka area
  final Set<Circle> _circles = {
    Circle(
      circleId: CircleId('dhakaCircle'),
      center: LatLng(23.8103, 90.4125), // Center of the circle
      radius: 5000, // Radius in meters (5 kilometers)
      strokeColor: Colors.red, // Border color
      strokeWidth: 0, // Border width
      fillColor: Colors.red.withOpacity(0.15), // Fill color with opacity
    ),
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.add(
        Marker(
            markerId: MarkerId("dhaka_area_id"),
            position: LatLng(23.8103, 90.4125),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
                title: "Dhaka, Bangladesh"
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: HomeResturantAppBar(),
                ),
                20.heightBox,

                Container(
                  width: width,
                  height: height,
                  child: GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    circles: _circles,
                    markers: Set<Marker>.of(_marker),
                    onMapCreated: (controller) {
                      _controller.complete(controller);
                    },
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
