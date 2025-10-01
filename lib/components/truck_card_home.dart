import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/model/truck_model.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TruckWidget extends StatelessWidget {
  const TruckWidget({
    super.key,
    required this.truck,
  });

  final TruckModel truck;

  @override
  Widget build(BuildContext context) {
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
          // ClipRRect(
          //   borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          //   child: CachedNetworkImage(
          //     imageUrl: "",
          //     height: 120.h,
          //     width: 160.w,
          //     fit: BoxFit.cover,
          //     placeholder: (context, url) => const Center(
          //       child: CircularProgressIndicator(strokeWidth: 2),
          //     ),
          //     errorWidget: (context, url, error) =>
          //         const Icon(Icons.error, size: 40, color: Colors.red),
          //   ),
          // ),

          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: CachedNetworkImage(
              imageUrl: "",
              height: 120.h,
              width: 160.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 120.h,
                  width: 160.w,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, size: 40, color: Colors.red),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      // text: truck.truckName,
                      text: truck.truckName.toString() ?? "",
                      fontsize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.plusJakartaSansExtraBold,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16.r, color: Colors.yellow[700]),
                        SizedBox(width: 2.w),
                        CustomText(
                          text: truck.averageRating.toString(),
                          fontsize: 12.0,
                          fontFamily: AppFonts.plusJakartaSansLight,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: "${truck.distance.toString()} Km",
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
  }
}
