
// Shimmer Effect Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerEffect() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        
        // Profile and Notification Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Profile Circle Shimmer
                Container(
                  width: 60.r,
                  height: 60.r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Location Text Shimmer
                    Container(
                      width: 150.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // Address Text Shimmer
                    Container(
                      width: 180.w,
                      height: 17.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Notification Icon Shimmer
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        
        SizedBox(height: 20.h),
        
        // Search and Filter Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Search Bar Shimmer
            Container(
              height: 50.h,
              width: Get.width * 0.75,
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            // Filter Button Shimmer
            Container(
              height: 50.h,
              width: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        
        SizedBox(height: 20.h),
        
        // Map Image Shimmer
        Container(
          height: 400.h,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        
        SizedBox(height: 20.h),
        
        // "Recommend for you" Text Shimmer
        Container(
          width: 150.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        
        SizedBox(height: 4.h),
        
        // "Popular 5 Food Truck" Text Shimmer
        Container(
          width: 250.w,
          height: 22.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        
        SizedBox(height: 12.h),
        
        // Recommended Trucks Horizontal List Shimmer
        SizedBox(
          height: 380.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Show 3 shimmer items
            itemBuilder: (context, index) {
              return Container(
                width: 280.w,
                margin: EdgeInsets.only(right: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Shimmer
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Title Shimmer
                    Container(
                      width: 200.w,
                      height: 20.h,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Subtitle Shimmer
                    Container(
                      width: 150.w,
                      height: 16.h,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // Rating Shimmer
                    Container(
                      width: 100.w,
                      height: 16.h,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        
        SizedBox(height: 20.h),
        
        // Nearby Truck Header Shimmer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            Container(
              width: 80.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
        
        SizedBox(height: 12.h),
        
        // Nearby Trucks Horizontal List Shimmer
        SizedBox(
          height: 180.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4, // Show 4 shimmer items
            itemBuilder: (context, index) {
              return Container(
                width: 160.w,
                margin: EdgeInsets.only(right: 12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Shimmer
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Title Shimmer
                    Container(
                      width: 120.w,
                      height: 16.h,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // Subtitle Shimmer
                    Container(
                      width: 100.w,
                      height: 14.h,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
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
  );
}