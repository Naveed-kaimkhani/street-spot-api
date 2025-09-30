

import 'package:StreetSpot/controller/auth_controller.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/custom_widgets/customNavBar.dart';
import 'package:StreetSpot/views/cart/cart_screen.dart';
import 'package:StreetSpot/views/selectionuserpage.dart';
import 'package:StreetSpot/views/seller/sellerlogin.dart';
import 'package:StreetSpot/views/user/checkoutpage.dart';
import 'package:StreetSpot/views/user/detailpage.dart';
import 'package:StreetSpot/views/user/homescreen.dart';
import 'package:StreetSpot/views/user/mainscreen.dart';
import 'package:StreetSpot/views/user/storepage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  final userController = Get.put(UserController(),permanent: true);
  final authController = Get.put(AuthController(authRepo: Get.find()),permanent: true);
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() {
    Timer(const Duration(seconds: 3), () async {
      await userController.getUserFromPrefs();

      if (userController.token.value.isNotEmpty) {
        // Get.offAll(() => Sellerbottombar());

Get.to(() => MainScreen());

// Get.to(() => BurgerDetailsPage());

        // Get.to(() => Dashboardscreen());
      } else {
        // Get.offAll(() => UserSellerPage());

        Get.to(() => UserSellerPage());
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your splash screen content here
            Image.asset("assets/images/splashlogo.png"),
          ],
        ),
      ),
    );
  }
}
