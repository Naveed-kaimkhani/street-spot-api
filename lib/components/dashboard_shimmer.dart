import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: 12.w, vertical: 22.h), // ✅ top padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Circle + Settings Button
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Center(
                child: ShimmerBox(
                  width: 70.w, // smaller circle
                  height: 70.h,
                  borderRadius: 35.r,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: ShimmerBox(
                  width: 40.r,
                  height: 40.r,
                  borderRadius: 20.r,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // User name placeholder
          ShimmerText(width: 80.w, height: 12.h),

          SizedBox(height: 10.h),

          // Overview Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShimmerBox(width: 120.w, height: 35.h, borderRadius: 6.r),
              ShimmerBox(width: 120.w, height: 35.h, borderRadius: 6.r),
            ],
          ),

          SizedBox(height: 16.h),

          // Graph placeholder
          ShimmerBox(width: double.infinity, height: 160.h, borderRadius: 10.r),

          SizedBox(height: 16.h),

          // Popular Menu Items
          Align(
            alignment: Alignment.centerLeft,
            child: ShimmerText(width: 120.w, height: 12.h),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 100.h, // smaller
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: ShimmerBox(
                    width: 90.w,
                    height: 90.h,
                    borderRadius: 12.r,
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 16.h),

          // Products Grid Skeleton
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w, // reduced spacing
              mainAxisSpacing: 8.h,
              childAspectRatio: 0.75,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ShimmerBox(
                width: double.infinity,
                height: 150.h, // smaller cards
                borderRadius: 12.r,
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Small reusable shimmer widgets
class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ShimmerText extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerText({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerBox(width: width, height: height, borderRadius: 4);
  }
}
