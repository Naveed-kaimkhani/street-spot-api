import 'package:StreetSpot/helpers/appbindings.dart';
import 'package:StreetSpot/views/selectionuserpage.dart';
import 'package:StreetSpot/views/seller/AddMenuItemScreen.dart';
import 'package:StreetSpot/views/seller/sellerbottombar.dart';
import 'package:StreetSpot/views/seller/sellerlogin.dart';
import 'package:StreetSpot/views/user/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:StreetSpot/routes/route_name.dart' show AppRouteName;
import 'package:StreetSpot/views/seller/customerinteractionscreen.dart';
import 'package:StreetSpot/views/seller/dashboardscreen.dart';
import 'package:StreetSpot/views/seller/notificationscreen.dart';
import 'package:StreetSpot/views/seller/ownerprofilescreen.dart';

import 'package:StreetSpot/views/user/checkoutpage.dart';
import 'package:StreetSpot/views/user/detailpage.dart';
import 'package:StreetSpot/views/user/homescreen.dart';
import 'package:StreetSpot/views/user/location.dart';

import 'package:StreetSpot/views/user/notificationscreen.dart';
import 'package:StreetSpot/views/profilepage/emailverification.dart';
import 'package:StreetSpot/views/profilepage/forgotpassword.dart';
import 'package:StreetSpot/views/profilepage/resetpassword.dart';
import 'package:StreetSpot/views/user/personalinformationscreen.dart';
import 'package:StreetSpot/views/user/profilesettingscreen.dart';
import 'package:StreetSpot/views/user/reviewscreen.dart';
import 'package:StreetSpot/views/user/splashscreen.dart' show SplashScreen;
import 'package:StreetSpot/views/user/storepage.dart';
import 'package:StreetSpot/views/user/trackyourorder.dart';
import 'package:get/get.dart';

class AppRouters {
  static final List<GetPage> routes = [
    // ======================> Auth
    GetPage(
      name: AppRouteName.SPLASH_SCREEN_ROUTE,
      page: () => const SplashScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.sellerbottomnavbar,
      page: () => const Sellerbottombar(),
      binding: AppBindings(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.SPLASH_SCREEN_ROUTE,
      page: () => const SplashScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.usersellersection,
      page: () => UserSellerPage(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.sellerlogin,
      page: () => Sellerlogin(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.bottomnavbar,
      page: () => const MainScreen(),
      binding: AppBindings(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: AppRouteName.customerinteraction,
      page: () => const Customerinteractionscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.sellernotificationscreen,
      page: () => const SellerNotificationscreen(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: AppRouteName.dashboardscreen,
      page: () => const Dashboardscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.personalinformation,
      page: () => const Personalinformationscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.truckownerscreen,
      page: () => const TruckOwnerProfileScreen(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: AppRouteName.ADD_MEMU_ITEM,
      page: () => const AddMenuItemScreen(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: AppRouteName.profilepagescreen,
      page: () => const Profilesettingscreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.HOME_SCREEN_ROUTE,
      page: () => const HomePage(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.emailverification,
      page: () {
        final args = Get.arguments as Map<String, dynamic>? ?? {};
        return VerifyEmailScreen(
          isFromForgotPassword: args["isFromForgotPassword"] ?? false,
          email: args["email"],
        );
      },
    ),
    GetPage(
      name: AppRouteName.Trackyouroder_ROUTE,
      page: () => TrackOrderScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.FORGOT_PASSWORD_SCREEN_ROUTE,
      page: () => ForgotPasswordScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.Reset_SCREEN_ROUTE,
      page: () => ResetPasswordScreen(),
      curve: Curves.easeIn,
    ),

    GetPage(
      name: AppRouteName.IN_APP_NOTIFICATION_SCREEN_ROUTE,
      page: () => NotificationScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.Review_SCREEN_ROUTE,
      page: () => ReviewScreen(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.location_SCREEN_ROUTE,
      page: () => LocationScreen(),
      curve: Curves.easeIn,
    ),
    // GetPage(
    //   name: AppRouteName.DETAIL_SCREEN_ROUTE,
    //   page: () => BurgerDetailsPage(),
    //   curve: Curves.easeIn,
    // ),
    GetPage(
      name: AppRouteName.CHECKOUTs_SCREEN_ROUTE,
      page: () => CheckoutPage(),
      curve: Curves.easeIn,
    ),
    GetPage(
      name: AppRouteName.Store_SCREEN_ROUTE,
      page: () => StorePage(),
      curve: Curves.easeIn,
    ),
  ];
}
