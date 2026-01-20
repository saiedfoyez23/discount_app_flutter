import 'package:discount_me_app/utils/utils.dart';
import 'package:discount_me_app/view/brokers/broker_home_view/view/broker_home_screen.dart';
import 'package:discount_me_app/view/brokers/broker_profile_view/view/broker_profile_home_screen.dart';
import 'package:discount_me_app/view/brokers/broker_referral_view/view/broker_referral_home_screen.dart';
import 'package:discount_me_app/view/brokers/broker_subscription_view/view/broker_subscription_home_screen.dart';
import 'package:flutter/material.dart';

class BrokerHome extends StatefulWidget {
  const BrokerHome({super.key});

  @override
  State<BrokerHome> createState() => _BrokerHomeState();
}

class _BrokerHomeState extends State<BrokerHome> {
  int _selectedIndex = 0;
  // List of body views based on selected index
  final List<Widget> _bodyOptions = <Widget>[
    BrokerHomeScreen(),
    BrokerSubscriptionHomeScreen(),
    BrokerReferralHomeScreen(),
    BrokerProfileHomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
                icon: Icon(Icons.home_outlined, size: 28.sp(context),),
                activeIcon: Icon(Icons.home,size: 28.sp(context),),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageUtils.subscription, scale: 4,),
                activeIcon: Image.asset(ImageUtils.subscriptionOutline, scale: 4,),
                label: 'Subscription',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageUtils.navRefer, scale: 4,),
                activeIcon: Image.asset(ImageUtils.navReferOutline, scale: 4,),
                label: 'Referral',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 28.sp(context),),
                activeIcon: Icon(Icons.person, size: 28.sp(context),),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

