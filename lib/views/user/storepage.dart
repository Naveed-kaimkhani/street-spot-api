import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:get/get.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Image
              Container(
                height: 250.h,
                width: double.infinity,
                child: Image.asset(
                  storeImage,
                  fit: BoxFit.cover,
                ),
              ),
              // Store Details
              Padding(
                padding: EdgeInsets.all(10.0),
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
                              storeName,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              storeDescription,
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
                            style: TextStyle(color: Colors.white),
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
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return GestureDetector(
                          onTap: () {
                            Get.offNamed(AppRouteName.DETAIL_SCREEN_ROUTE);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item['image']!,
                                      height: 80.h,
                                      width: 80.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['title']!,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          item['subtitle']!,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          item['price']!,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.pink,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
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
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: schedule.entries.map((entry) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                Text(
                                  entry.value,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.grey),
                                ),
                              ],
                            ),
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
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
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
                                    '$averageRating ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.star,
                                      color: Colors.pink, size: 16.sp),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '$totalReviews Reviews',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Column(
                            children: [
                              _buildRatingBar(5, 0.9),
                              _buildRatingBar(4, 0.7),
                              _buildRatingBar(3, 0.5),
                              _buildRatingBar(2, 0.3),
                              _buildRatingBar(1, 0.1),
                            ],
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
                                  Get.toNamed(AppRouteName.Review_SCREEN_ROUTE);
                                },
                                child: Text(
                                  'Write a review',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
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
  }

  Widget _buildCategoryButton(String title) {
    return ElevatedButton(
      onPressed: () {
        // Handle category selection
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.black),
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
                    gradient: LinearGradient(
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
