import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/menu_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    super.key,
    required this.item,
  });

  final MenuItem2 item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.offNamed(AppRouteName.DETAIL_SCREEN_ROUTE);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      "${ApiEndpoints.image}${item.imageUrl}", // 👈 network image
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 40),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // item['title']!,
                      item.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      // item['subtitle']!,
                      item.description,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "\$${item.unitPrice.toString()}",
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
  }
}
