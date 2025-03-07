// ignore_for_file: prefer_const_constructors

import 'package:discount_me_app/res/app_const/appNames.dart';
import 'package:discount_me_app/res/app_const/import_list.dart';
import 'package:discount_me_app/view/users/user_profile_order_view/view/user_profile_order_status_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: RouteNames.splashViewOne, page: () => SplashViewOne()),
    GetPage(name: RouteNames.splashViewTwo, page: () => SplashViewTwo()),

    // Authentication screens
    GetPage(name: RouteNames.welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: RouteNames.signUpScreen, page: () => SignUpScreen()),
    GetPage(name: RouteNames.signInScreen, page: () => SignInScreen()),
    GetPage(name: RouteNames.forgotPasswordScreen, page: () => ForgotPasswordScreen()),

    // User screens
    GetPage(name: RouteNames.home, page: () => UserHome()),
    GetPage(name: RouteNames.userHomeScreen, page: () => UserHomeScreen()),
    GetPage(name: RouteNames.restaurantProfileScreen, page: () => ResturantProfileScreen()),
    GetPage(name: RouteNames.restaurantListScreen, page: () => ResturantListScreen()),
    GetPage(name: RouteNames.recipesScreen, page: () => RecipesScreen()),
    GetPage(name: RouteNames.orderScreen, page: () => OrderScreen()),
    GetPage(name: RouteNames.orderCompleteScreen, page: () => OrderCompleteScreen()),

    GetPage(name: RouteNames.couponHomeScreen, page: () => CouponHomeScreen()),
    GetPage(name: RouteNames.paymentMethodScreen, page: () => PaymentMethodScreen()),
    GetPage(name: RouteNames.paymentInformationScreen, page: () => PaymentInformationScreen()),
    GetPage(name: RouteNames.transactionSuccessScreen, page: () => TransactionSuccessScreen()),

    GetPage(name: RouteNames.exploreRecipesScreen, page: () => ExploreRecipesScreen()),

    // User Profile screens
    GetPage(name: RouteNames.userProfileHomeScreen, page: () => UserProfileHomeScreen()),
    GetPage(name: RouteNames.userProfileEditScreen, page: () => UserProfileEditScreen()),
    GetPage(name: RouteNames.userProfileSettingScreen, page: () => UserProfileSettingScreen()),
    GetPage(name: RouteNames.userChangePasswordScreen, page: () => UserChangePasswordScreen()),
    GetPage(name: RouteNames.userNotificationScreen, page: () => UserNotificationScreen()),
    GetPage(name: RouteNames.userProfileOrderStatusScreen, page: () => UserProfileOrderStatusScreen()),

    // Rider screens
    GetPage(name: RouteNames.riderHomeScreen, page: () => RiderHomeScreen()),
  ];
}
