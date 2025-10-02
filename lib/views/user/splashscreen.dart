

import 'package:StreetSpot/binding/auth_binding.dart';
import 'package:StreetSpot/binding/order_binding.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/views/order/order_screen.dart';
import 'package:StreetSpot/views/selectionuserpage.dart';
import 'package:StreetSpot/views/seller/sellerlogin.dart';
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
  // final authController = Get.put(AuthController(authRepo: Get.find()),permanent: true);
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
          if (userController.user.value!.role == 'TRUCK_OWNER') {
    // Seller (Truck Owner)
    // Get.offAllNamed(AppRouteName.sellerbottomnavbar);

        Get.offAll(() => UserSellerPage(),binding: AuthBinding());
  } else {
    // Normal User
    Get.offAllNamed(AppRouteName.bottomnavbar);
  }

// Get.to(() => OrderScreen(),binding: OrderBinding());
      } else {

        Get.offAll(() => UserSellerPage(),binding: AuthBinding());
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
