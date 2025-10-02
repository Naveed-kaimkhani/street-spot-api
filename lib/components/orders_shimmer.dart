import 'package:StreetSpot/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
// class OrdersShimmer extends StatelessWidget {
//   const OrdersShimmer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 16.h),
//         Expanded(
//           child: Shimmer.fromColors(
//             baseColor: Colors.grey[300]!,
//             highlightColor: Colors.grey[100]!,
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: Column(
//                 children: List.generate(4, (index) => _buildShimmerOrderCard()),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildShimmerOrderCard() {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _shimmerLine(width: 140.w, height: 20.h), // restaurant name
//                     SizedBox(height: 6.h),
//                     _shimmerLine(width: 80.w, height: 14.h), // cuisine
//                   ],
//                 ),
//                 _shimmerBox(width: 100.w, height: 24.h, radius: 12.r), // status
//               ],
//             ),

//             SizedBox(height: 20.h),

//             // Order items
//             ...List.generate(2, (index) => _buildShimmerOrderItem()),

//             SizedBox(height: 16.h),
//             Divider(color: AppColors.LIGHT_GREY_COLOR, thickness: 1.h),
//             SizedBox(height: 16.h),

//             // Footer
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _shimmerLine(width: 70.w, height: 14.h), // label
//                     SizedBox(height: 6.h),
//                     _shimmerLine(width: 60.w, height: 20.h), // amount
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     _shimmerLine(width: 70.w, height: 14.h), // label
//                     SizedBox(height: 6.h),
//                     _shimmerLine(width: 120.w, height: 16.h), // datetime
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _shimmerLine({required double width, required double height}) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         color: Colors.grey[300], // 👈 shimmer base color
//         borderRadius: BorderRadius.circular(4.r),
//       ),
//     );
//   }

//   Widget _shimmerBox({required double width, required double height, double radius = 6}) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         color: Colors.grey[300], // 👈 shimmer base color
//         borderRadius: BorderRadius.circular(radius.r),
//       ),
//     );
//   }

//   Widget _buildShimmerOrderItem() {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: Row(
//         children: [
//           _shimmerBox(width: 30.w, height: 18.h), // quantity
//           SizedBox(width: 8.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _shimmerBox(width: 150.w, height: 18.h), // item name
//                 SizedBox(height: 4.h),
//                 _shimmerBox(width: 80.w, height: 14.h), // price
//               ],
//             ),
//           ),
//           _shimmerBox(width: 50.w, height: 18.h), // total price
//         ],
//       ),
//     );
//   }
// }



class OrdersShimmer extends StatelessWidget {
  const OrdersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!, // shimmer base
            highlightColor: Colors.grey[100]!, // shimmer highlight
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: List.generate(3, (index) => _buildShimmerOrderCard()),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerOrderCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white, // keep card background white
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _shimmerLine(width: 140.w, height: 20.h), // restaurant name
                    SizedBox(height: 6.h),
                    _shimmerLine(width: 80.w, height: 14.h), // cuisine
                  ],
                ),
                _shimmerBox(width: 100.w, height: 24.h, radius: 12.r), // status
              ],
            ),
            SizedBox(height: 20.h),

            // Order items
            ...List.generate(2, (index) => _buildShimmerOrderItem()),

            SizedBox(height: 16.h),
            Divider(color: AppColors.LIGHT_GREY_COLOR, thickness: 1.h),
            SizedBox(height: 16.h),

            // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _shimmerLine(width: 70.w, height: 14.h), // label
                    SizedBox(height: 6.h),
                    _shimmerLine(width: 60.w, height: 20.h), // amount
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _shimmerLine(width: 70.w, height: 14.h), // label
                    SizedBox(height: 6.h),
                    _shimmerLine(width: 120.w, height: 16.h), // datetime
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _shimmerLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300], // 👈 shimmer base (not white!)
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  Widget _shimmerBox({required double width, required double height, double radius = 6}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300], // 👈 shimmer base
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }

  Widget _buildShimmerOrderItem() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          // Bullet point shimmer (circle)
          Container(
            width: 12.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: Colors.grey[300], // 👈 shimmer base
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _shimmerLine(width: double.infinity, height: 18.h), // item name
                SizedBox(height: 4.h),
                _shimmerLine(width: 80.w, height: 14.h), // price
              ],
            ),
          ),
          _shimmerLine(width: 50.w, height: 18.h), // total price
        ],
      ),
    );
  }
}
