import 'dart:developer';

import 'package:StreetSpot/components/days_card_widget.dart';
import 'package:StreetSpot/components/menu_card_widget.dart';
import 'package:StreetSpot/controller/dashboard_controller.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/truck_model.dart';
import 'package:StreetSpot/model/weekly_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:get/get.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late final int id;
  // late final DashboardController controller;

  final DashboardController controller = Get.find<DashboardController>();

  // Sample store data
  final String storeImage = 'assets/images/burgerimg.png';

  final String storeName = 'The Rolling Bite';

  final String storeDescription =
      'Delicious burgers and fast food with a twist!';

  final bool isFollowing = false;

  // Sample menu data (dynamic)
  final List<Map<String, String>> menuItems = [
    {
      'image': 'assets/images/ordinaryburger.png',
      'title': 'Classic Burger',
      'subtitle': 'Juicy beef patty with cheese',
      'price': '\$10.99',
    },
    {
      'image': 'assets/images/burger2.png',
      'title': 'Spicy Chicken Burger',
      'subtitle': 'Spicy chicken with fresh veggies',
      'price': '\$12.99',
    },
    {
      'image': 'assets/images/ordinaryburger.png',
      'title': 'Veggie Delight',
      'subtitle': 'Vegan patty with organic toppings',
      'price': '\$9.99',
    },
  ];

  // Sample location data
  final String location = '123 Food St, Austin TX';

  // Sample schedule data
  final Map<String, String> schedule = {
    'Monday': '10:00 AM - 10:00 PM',
    'Tuesday': '10:00 AM - 10:00 PM',
    'Wednesday': '10:00 AM - 10:00 PM',
    'Thursday': '10:00 AM - 10:00 PM',
    'Friday': '10:00 AM - 11:00 PM',
    'Saturday': '11:00 AM - 11:00 PM',
    'Sunday': 'Closed',
  };

  // Sample ratings data
  final double averageRating = 4.5;

  final int totalReviews = 273;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments as Map<String, dynamic>;
    id = args['id'] as int;

    // Delay the API call until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchTruckInformation(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TruckModel truck = controller.truckData.value!;

    return Obx(() {
      if (controller.isLoading.value) {
        // ✅ Show loading indicator
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (controller.truckData.value == null) {
        // ✅ Handle empty/error case
        return const Scaffold(
          body: Center(
            child: Text("No data found"),
          ),
        );
      }

      final truckResponse = controller.truckData.value!;
      final TruckModel truck = truckResponse.truck;
      final reviews = truckResponse.truckReviewChart;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Store Image
                SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: Image.asset(
                    storeImage,
                    fit: BoxFit.cover,
                  ),
                ),
                // Store Details
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                truck.truckName,
                                // truck,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "storeDescription",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Toggle follow logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isFollowing ? Colors.grey : Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              isFollowing ? 'Following' : 'Follow',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),

                      // Categories
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCategoryButton('Menu'),
                          _buildCategoryButton('Location'),
                          _buildCategoryButton('Ratings & Reviews'),
                        ],
                      ),
                      SizedBox(height: 15.h),

                      // Menu Section
                      Text(
                        'Menu',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // itemCount: menuItems.length,
                        itemCount: truck.menuItems!.length,
                        itemBuilder: (context, index) {
                          final item = truck.menuItems![index];
                          return MenuCardWidget(item: item);
                        },
                      ),
                      SizedBox(height: 15.h),

                      // Location Section
                      Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRouteName.location_SCREEN_ROUTE);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.orange, size: 20.sp),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Text(
                                  location,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // Schedule Section
                      Text(
                        'Schedule',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: truck.weeklySchedule.map((entry) {
                            return DaysCardWidget(
                              weeklySchedule: entry,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // Ratings & Reviews Section
                      Text(
                        'Ratings & Reviews',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Summary',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${truck.averageRating} ',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.star,
                                        color: Colors.pink, size: 16.sp),
                                    SizedBox(width: 5.w),
                                    Text(
                                      '${reviews.length} Reviews',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Column(
                              children: reviews.map((review) {
                                final progress = review.ratingCount
                                    .toDouble(); // you can normalize if needed
                                return _buildRatingBar(review.rating, progress);
                              }).toList(),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '88% Recommended',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Get.toNamed(
                                        AppRouteName.Review_SCREEN_ROUTE);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Write a review',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCategoryButton(String title) {
    return ElevatedButton(
      onPressed: () {
        // Handle category selection
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildRatingBar(int stars, double fill) {
    return Row(
      children: [
        Text('$stars', style: TextStyle(fontSize: 16.sp)),
        SizedBox(width: 10.w),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                widthFactor: fill,
                child: Container(
                  height: 10.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.pink, Colors.orange],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
