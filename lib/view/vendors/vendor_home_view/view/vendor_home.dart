// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:discount_me_app/view/vendors/vendor_profile_view/view/vendor_profile_home_view.dart';
import 'package:flutter/material.dart';
import 'package:discount_me_app/view/view.dart';
import 'package:discount_me_app/utils/utils.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({super.key,required this.selectedIndex});
  final int selectedIndex;
  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  int _selectedIndex = 0;
  // List of body views based on selected index
  static List<Widget> _bodyOptions = <Widget>[
    VendorHomeScreen(),
    VendorSubscriptionView(),
    VendorItemView(),
    VendorProfileHomeView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyOptions[_selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: ColorUtils.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: ColorUtils.primaryColor,
                  offset: Offset(0, 1),blurRadius: 5
              )
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 20),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            enableFeedback: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 28.sp(context)),
                activeIcon: Icon(Icons.home, size: 28.sp(context)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageUtils.subscription, scale: 4,),
                activeIcon: Image.asset(ImageUtils.subscriptionOutline, scale: 4,),
                label: 'Subscription',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageUtils.navItemIcon, scale: 4,),
                activeIcon: Image.asset(ImageUtils.navItemOutlineIcon, scale: 4,),
                label: 'Items',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 28.sp(context)),
                activeIcon: Icon(Icons.person, size: 28.sp(context)),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

