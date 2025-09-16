import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:get/get.dart';

class TrackOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    return Scaffold(
      backgroundColor:
          Colors.white, // Match the dark background of the screenshot
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Map Section
          Container(
            height: 0.6.sh, // 60% of screen height to match the screenshot
            child: Stack(
              children: [
                // Map Image
                Image.asset(
                  "assets/images/trackordreimage.JPG", // Replace with your map image asset
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 0.6.sh,
                ),
                // Back Button, Title, and Track your Time
                Positioned(
                  top: 40.h,
                  left: 10.w,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 54.h,
                  left: 60.w,
                  child: Text(
                    'Track Your Order',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 70.h,
                  left: 60.w,
                  child: Text(
                    'Track your Time',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Profile Container
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRouteName.Review_SCREEN_ROUTE);
            },
            child: Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.r,
                    backgroundImage: AssetImage(
                        'assets/images/profile pic.jpg'), // Replace with profile image asset
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cristopert Dustin',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ID 213752',
                        style:
                            TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Estimated Time
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Estimated 8:30 - 9:15 PM',
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontsize: 16.sp,
                ),
                SizedBox(width: 10.w),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Image.asset("assets/images/orderprogresss.png"),
          ),
          SizedBox(
            height: 10.h,
          ),
          // Order Details and Price
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 Burger With Meat',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$283',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
