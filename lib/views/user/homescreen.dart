import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/model/restaurentmodel.dart';
import 'package:StreetSpot/model/truck.dart' show Truck;
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Burger Uncle',
      imagePath: 'assets/images/restaurentimg.png',
      category: 'Burger & Chips',
      rating: 5.0,
      time: '12min',
      galleryImages: [
        'assets/images/gallery.png',
        'assets/images/gallery1.png',
        'assets/images/gallery1.png', // Duplicate for "More+" effect
      ],
    ),
    // Add more restaurants as needed
    Restaurant(
      name: 'Taco Haven',
      imagePath: 'assets/images/restaurentimg.png',
      category: 'Mexican Tacos',
      rating: 4.8,
      time: '10min',
      galleryImages: [
        'assets/images/gallery.png',
        'assets/images/gallery1.png',
        'assets/images/gallery1.png',
      ],
    ),
  ];

  final List<Truck> trucks = [
    Truck(
      title: 'Fish & Chips',
      imagePath: 'assets/images/image 2.png',
      categoryDistance: 'Street Food • 1.2km',
      rating: 5.0,
    ),
    Truck(
      title: 'Burger Uncle',
      imagePath: 'assets/images/image 2.png',
      categoryDistance: 'Fast Food • 0.8km',
      rating: 4.5,
    ),
    // Add more truck data as needed
    Truck(
      title: 'Taco Truck',
      imagePath: 'assets/images/image 2.png',
      categoryDistance: 'Mexican • 1.5km',
      rating: 4.8,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h), // Top padding
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // To space out the elements
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouteName.profilepagescreen);
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage:
                              const AssetImage("assets/images/phonepen.png"),
                          backgroundColor: Colors.pink[100],
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Your Current Location",
                              fontFamily: AppFonts.plusJakartaSansLight,
                              fontsize: 16.0,
                            ),
                            SizedBox(height: 4.h),
                            const CustomText(
                              text: 'Phnom Penh, Cambodia',
                              fontsize: 17.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Notification icon with count
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                          AppRouteName.IN_APP_NOTIFICATION_SCREEN_ROUTE);
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: 50.r, // Adjust size as needed
                          height: 50.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Colors.grey[200], // Background color of circle
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            size: 24.r,
                            color: Colors.black, // Adjust icon color
                          ),
                        ),
                        // Notification count badge
                        Container(
                          width: 20.r,
                          height: 20.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red, // Badge color
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Center(
                              child: CustomText(
                                text: '3', // Replace with dynamic count
                                fontsize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Aligns children vertically centered
                children: [
                  // Search TextField Container
                  Container(
                    height: 50.h,
                    width: Get.width *
                        0.75, // Adjust width for filter button space
                    margin: EdgeInsets.only(
                        right: 8.w), // Space between search and filter
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextField(
                      textAlignVertical:
                          TextAlignVertical.center, // Centers text vertically
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 0, // Adjusted for vertical centering
                        ),
                      ),
                    ),
                  ),
                  // Circular Filter Button
                  Container(
                    height: 50.h,
                    width: 50.h, // Square for circular shape
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200], // Matches search box
                    ),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.grey,
                      size: 24.r,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 400.h,
                width: Get.width,
                child: Image.asset(
                  "assets/images/mapimg.png",
                  fit: BoxFit.cover, // Image fills the container perfectly
                ),
              ),
              const CustomText(
                text: "Recommend for you",
                fontFamily: AppFonts.plusJakartaSansLight,
                fontsize: 18.0,
                color: AppColors.APP_GRAY_COLOR,
              ),
              SizedBox(height: 4.h),
              const CustomText(
                text: 'Popular 5 Food Truck this week ',
                fontsize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.plusJakartaSansExtraBold,
              ),
              SizedBox(height: 12.h),
              SizedBox(
                  height: 380.h, // Adjust based on content

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurants[index];
                      return Container(
                        width: Get.width, // Full screen width for each item
                        margin:
                            EdgeInsets.only(right: 12.w), // Space between cards
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                // Main Image Container
                                SizedBox(
                                  height: 150.h,
                                  width: Get.width, // Full width for the image
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.asset(
                                      restaurant.imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Logo on Left Side
                                Positioned(
                                  left: 16.w,
                                  top: 16.h,
                                  child: Image.asset(
                                    'assets/images/logorestaurent.png',
                                    height: 50.h,
                                    width: 50.h,
                                  ),
                                ),
                                // Time Box on Right Side
                                Positioned(
                                  right: 30.w,
                                  top: 16.h,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Text(
                                      restaurant.time,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            // Gallery Images
                            SizedBox(
                              height: 120.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: restaurant.galleryImages.length,
                                itemBuilder: (context, galleryIndex) {
                                  final imagePath =
                                      restaurant.galleryImages[galleryIndex];
                                  return Container(
                                    margin: EdgeInsets.only(right: 6.w),
                                    width: 120.w,
                                    height: 120.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      image: DecorationImage(
                                        image: AssetImage(imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: galleryIndex ==
                                            restaurant.galleryImages.length - 1
                                        ? Center(
                                            child: Text(
                                              'More+',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        : null,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: restaurant.name,
                                      fontsize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          AppFonts.plusJakartaSansExtraBold,
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: restaurant.category,
                                          fontFamily:
                                              AppFonts.plusJakartaSansLight,
                                          fontsize: 14.0,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 8.w),
                                        Icon(Icons.star,
                                            size: 16.r,
                                            color: Colors.yellow[700]),
                                        SizedBox(width: 2.w),
                                        CustomText(
                                          text: restaurant.rating.toString(),
                                          fontsize: 14.0,
                                          fontFamily:
                                              AppFonts.plusJakartaSansLight,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: CustomButton(
                                    height: 40.h,
                                    buttonColor: Colors.orange,
                                    onTap: () {
                                      Get.toNamed(
                                          AppRouteName.Store_SCREEN_ROUTE);
                                      // AppNavigation.navigateCloseDialog(context);
                                    },
                                    buttonText: "Get Direction",
                                    fontSize: 14.sp,
                                    borderRadius: 20,
                                    fontFamily: AppFonts.plusJakartaSansRegular,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h), // Space between restaurants
                          ],
                        ),
                      );
                    },
                  )),
              //  Center(child: Image.asset("assets/images/carosuleimage.png")),
// SizedBox(height: 4.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Nearby Truck',
                    fontsize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.plusJakartaSansExtraBold,
                  ),
                  Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [
                              AppColors.klineargradient1,
                              AppColors.klineargradient2
                            ], // Customize gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: const CustomText(
                          text: 'View more',
                          fontsize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.plusJakartaSansExtraBold,
                          color: Colors.white,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [
                              AppColors.klineargradient1,
                              AppColors.klineargradient2
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 180.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trucks.length,
                  itemBuilder: (context, index) {
                    final truck = trucks[index];
                    return Container(
                      margin: EdgeInsets.only(right: 8.w),
                      width: 160.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.r)),
                            child: Image.asset(
                              truck.imagePath,
                              height: 120.h,
                              width: 160.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: truck.title,
                                      fontsize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          AppFonts.plusJakartaSansExtraBold,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            size: 16.r,
                                            color: Colors.yellow[700]),
                                        SizedBox(width: 2.w),
                                        CustomText(
                                          text: truck.rating.toString(),
                                          fontsize: 12.0,
                                          fontFamily:
                                              AppFonts.plusJakartaSansLight,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                CustomText(
                                  text: truck.categoryDistance,
                                  fontsize: 12.0,
                                  fontFamily: AppFonts.plusJakartaSansLight,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
