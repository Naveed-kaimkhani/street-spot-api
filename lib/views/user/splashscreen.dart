// import 'package:StreetSpot/controller/user_controller.dart';
// import 'package:StreetSpot/utils/utils.dart';
// import 'package:StreetSpot/views/selectionuserpage.dart';
// import 'package:StreetSpot/views/seller/dashboardscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:async';

// import 'package:get/get_core/src/get_main.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final UserController userController = Get.find<UserController>();
//   @override
//   void initState() {
//     super.initState();
//     // Start the timer when the splash screen is initialized
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => Dashboardscreen()),
//       );
//     });
//   }

//   void _checkAuthentication() async {
//     bool isConnected = await Utils.checkInternetConnection();
//     if (!isConnected) return;

//     // await userController.getUserFromPrefs();

//     // if (userController.token.value.isNotEmpty) {

//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     _checkAuthentication();
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Add your splash screen content here
//             Image.asset("assets/images/splashlogo.png"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/views/selectionuserpage.dart';
import 'package:StreetSpot/views/seller/AddMenuItemScreen.dart';
import 'package:StreetSpot/views/seller/dashboardscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  void _checkAuthentication() {
    Timer(const Duration(seconds: 3), () async {
      await userController.getUserFromPrefs();

      if (userController.token.value.isNotEmpty) {
        Get.offAll(() => Dashboardscreen());
      } else {
        Get.offAll(() => UserSellerPage());
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
