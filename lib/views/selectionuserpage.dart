import 'package:StreetSpot/controller/auth_controller.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserSellerPage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                authController.setRole("CUSTOMER"); // 👈 store role

                Get.toNamed(AppRouteName.LOGIN_SCREEN_ROUTE);
              },
              child: Container(
                width: 150.w, // Responsive width
                height: 100.h, // Responsive height
                margin: EdgeInsets.all(8.w), // Spacing between containers
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8.r), // Rounded corners
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_2,
                        color: Colors.white,
                      ),
                      Text(
                        'As a user',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container for "As a seller"
            GestureDetector(
              onTap: () {
                authController.setRole("TRUCK_OWNER"); // 👈 store role

                Get.toNamed(AppRouteName.sellerlogin);
              },
              child: Container(
                width: 150.w,
                height: 100.h, // Responsive height
                margin: EdgeInsets.all(8.w), // Spacing between containers
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8.r), // Rounded corners
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_4,
                        color: Colors.white,
                      ),
                      Text(
                        'As a Seller',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: UserSellerPage(),
//   ));
// }
