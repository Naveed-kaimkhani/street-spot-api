import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildStoreDetailsShimmer() {
  return SingleChildScrollView(
    
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Store Image Shimmer
        Container(
          height: 250.h,
          width: double.infinity,
          color: Colors.white,
        ),

        // Store Details Shimmer
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Store Name and Follow Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Store Name Shimmer
                        Container(
                          width: 200.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        // Store Description Shimmer
                        Container(
                          width: 150.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    // Follow Button Shimmer
                    Container(
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                // Categories Shimmer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryShimmer(),
                    _buildCategoryShimmer(),
                    _buildCategoryShimmer(),
                  ],
                ),
                SizedBox(height: 15.h),

                // Menu Section Header Shimmer
                Container(
                  width: 80.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 10.h),

                // Menu Items Shimmer
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4, // Show 4 shimmer menu items
                  itemBuilder: (context, index) {
                    return _buildMenuCardShimmer();
                  },
                ),
                SizedBox(height: 15.h),

                // Location Section Header Shimmer
                Container(
                  width: 80.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 10.h),

                // Location Card Shimmer
                Container(
                  height: 60.h,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      // Location Icon Shimmer
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Location Text Shimmer
                      Expanded(
                        child: Container(
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),

                // Schedule Section Header Shimmer
                Container(
                  width: 80.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 10.h),

                // Schedule Card Shimmer
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children:
                        List.generate(7, (index) => _buildDayScheduleShimmer()),
                  ),
                ),
                SizedBox(height: 15.h),

                // Ratings & Reviews Header Shimmer
                Container(
                  width: 150.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 10.h),

                // Ratings Card Shimmer
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Summary Row Shimmer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 80.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30.w,
                                height: 16.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Container(
                                width: 15.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Container(
                                width: 70.w,
                                height: 12.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      // Rating Bars Shimmer
                      Column(
                        children: List.generate(
                            5, (index) => _buildRatingBarShimmer()),
                      ),
                      SizedBox(height: 10.h),

                      // Recommendation Row Shimmer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120.w,
                            height: 16.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          // Write Review Button Shimmer
                          Container(
                            width: 120.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
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
        ),
      ],
    ),
  );
}

// Helper methods for shimmer components
Widget _buildCategoryShimmer() {
  return Container(
    width: 100.w,
    height: 40.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
    ),
  );
}

Widget _buildMenuCardShimmer() {
  return Container(
    margin: EdgeInsets.only(bottom: 12.h),
    padding: EdgeInsets.all(12.r),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Row(
      children: [
        // Menu Item Image Shimmer
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        SizedBox(width: 12.w),
        // Menu Item Details Shimmer
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 120.w,
                height: 18.h,
                margin: EdgeInsets.only(bottom: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              Container(
                width: 180.w,
                height: 14.h,
                margin: EdgeInsets.only(bottom: 6.h),
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
        ),
      ],
    ),
  );
}

Widget _buildDayScheduleShimmer() {
  return Container(
    margin: EdgeInsets.only(bottom: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        Container(
          width: 120.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    ),
  );
}

Widget _buildRatingBarShimmer() {
  return Container(
    margin: EdgeInsets.only(bottom: 8.h),
    child: Row(
      children: [
        Container(
          width: 80.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          width: 30.w,
          height: 14.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    ),
  );
}
