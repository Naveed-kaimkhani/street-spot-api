
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/utils.dart';
import 'package:StreetSpot/views/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusIndicator extends StatelessWidget {
  final String status;
  const OrderStatusIndicator({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Utils.getStatusColor(status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Utils. getStatusColor(status), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.r,
            height: 8.r,
            decoration: BoxDecoration(
              color: Utils.getStatusColor(status),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          CustomText(
            text: Utils.getStatusText(status),
            fontsize: 12.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: Utils.getStatusColor(status),
          ),
        ],
      ),
    );
  }
}