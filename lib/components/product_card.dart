import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final MenuItem product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
            
            

              Container(
                height: 100.h,     
               constraints: BoxConstraints(
        maxWidth: 200.w, // ✅ safe max width (GridView/ListView ke andar safe)
      ),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.r)),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(8.r)),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiEndpoints.image}${product.imageUrl}", // network image
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image, size: 40),
                  ),
                ),
              ),

              if ('new' == 'new') // Adjust this condition based on actual logic
                Positioned(
                  top: 8.w,
                  left: 8.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: CustomText(
                      text: 'New Arrival',
                      fontsize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: product.name,
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text:
                      "category", // Replace with product.category if available
                  fontsize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    CustomText(
                      text: product.timeToMake.toString(),
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      width: 16.w,
                    ),
                    Icon(Icons.star, size: 16.sp, color: Colors.yellow),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: product.averageRating.toString(),
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    CustomText(
                      text: '\$${product.unitPrice}',
                      fontsize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '10% off',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
