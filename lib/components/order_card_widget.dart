// import 'dart:developer' show log;

// import 'package:StreetSpot/components/order_status_indicator.dart';
// import 'package:StreetSpot/custom_widgets/custom_text.dart';
// import 'package:StreetSpot/model/order_model.dart';
// import 'package:StreetSpot/utils/app_colors.dart';
// import 'package:StreetSpot/utils/utils.dart' show Utils;
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class OrderCardWidget extends StatelessWidget {
//   final OrderModel order;
//   const OrderCardWidget({super.key, required this.order});

//   @override
//   Widget build(BuildContext context) {
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
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(16.r),
//           onTap: () {
//             log("Tapped on order: ${order.id}");
            
//           },
//           child: Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header with truck info and status
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomText(
//                             text:
//                                 // order['truck']['truck_name'] ?? 'Unknown Truck',
//                                 order.truck.truckName ,
//                             fontsize: 16.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                           SizedBox(height: 4.h),
//                           CustomText(
//                             // text: order['truck']['cuisine_type'] ?? '',
//                             text: order.truck.cuisineType,
//                             fontsize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.APP_GRAY_COLOR,
//                           ),
//                         ],
//                       ),
//                     ),
//                     // OrderStatusIndicator(status: order['status']),
//                     OrderStatusIndicator(status: order.status  ),
//                   ],
//                 ),

//                 SizedBox(height: 16.h),

//                 // Order items
//       //           ..._buildOrderItems(  [
//       //   {"name": "Unknown Item", "quantity": 0, "price": "0.00"},
//       //   {"name": "Unknown Item", "quantity": 0, "price": "0.00"}
//       // ], ),

//                 SizedBox(height: 12.h),

//                 // Divider
//                 Container(
//                   height: 1.h,
//                   color: AppColors.LIGHT_GREY_COLOR,
//                 ),

//                 SizedBox(height: 12.h),

//                 // Footer with total and time
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomText(
//                           text: 'Total Amount',
//                           fontsize: 12.sp,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.APP_GRAY_COLOR,
//                         ),
//                         SizedBox(height: 2.h),
//                         CustomText(
//                           text: '\$${order.paidAmount }',
//                           fontsize: 18.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         CustomText(
//                           text: 'Order Time',
//                           fontsize: 12.sp,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.APP_GRAY_COLOR,
//                         ),
//                         SizedBox(height: 2.h),
//                         CustomText(
//                           text: Utils.formatDate(Utils.formatDate(order.createdAt.toString()) ),
//                           fontsize: 12.sp,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//     List<Widget> _buildOrderItems(List<dynamic> items) {
//     return items.map<Widget>((item) {
//       return Padding(
//         padding: EdgeInsets.symmetric(vertical: 4.h),
//         child: Row(
//           children: [
//             Container(
//               width: 4.r,
//               height: 4.r,
//               decoration: const BoxDecoration(
//                 color: AppColors.klineargradient1,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             SizedBox(width: 8.w),
//             Expanded(
//               child: CustomText(
//                 text: '${item['quantity']}x ${item['name']}',
//                 fontsize: 14.sp,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//               ),
//             ),
//             CustomText(
//               text: '\$${item['price']}',
//               fontsize: 14.sp,
//               fontWeight: FontWeight.w600,
//               color: AppColors.klineargradient1,
//             ),
//           ],
//         ),
//       );
//     }).toList();
//   }
// }


import 'dart:developer' show log;
import 'package:StreetSpot/components/order_status_indicator.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/model/order_model.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/utils.dart' show Utils;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderCardWidget extends StatelessWidget {
  final OrderModel order;
  final Function(String newStatus)? onStatusChanged; // 🔥 callback

  const OrderCardWidget({
    super.key,
    required this.order,
    this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
  log(order.status);
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () => log("Tapped on order: ${order.id}"),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with truck info and status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: order.truck.truckName,
                            fontsize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: order.truck.cuisineType,
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.APP_GRAY_COLOR,
                          ),
                        ],
                      ),
                    ),
                    
                    // 🔥 Dropdown for status change
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.LIGHT_GREY_COLOR),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: DropdownButton<String>(
                        value: Utils.getStatusText(   order.status),
                        underline: const SizedBox(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        onChanged: (newValue) {
                          if (newValue != null) {
                          if (onStatusChanged != null) {
                              onStatusChanged!(newValue); // 🔥 trigger callback
                            }
                          }
                        },
                        items: const [
                          DropdownMenuItem(value: "Pending Approval", child: Text("Pending")),
                          DropdownMenuItem(value: "Accepted", child: Text("Accepted")),
                          DropdownMenuItem(value: "In Progress", child: Text("In Progress")),
                          DropdownMenuItem(value: "Completed", child: Text("Completed")),
                          DropdownMenuItem(value: "Preparing", child: Text("Cancelled")),
                            DropdownMenuItem(value: "Approved", child: Text("Approved")),
                     
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Order items
                ..._buildOrderItems([
        {"name": "Unknown Item", "quantity": 0, "price": "0.00"},
        {"name": "Unknown Item", "quantity": 0, "price": "0.00"}
      ],),

                SizedBox(height: 12.h),

                // Divider
                Container(
                  height: 1.h,
                  color: AppColors.LIGHT_GREY_COLOR,
                ),

                SizedBox(height: 12.h),

                // Footer with total and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Total Amount',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        SizedBox(height: 2.h),
                        CustomText(
                          text: '\$${order.paidAmount}',
                          fontsize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          text: 'Order Time',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        SizedBox(height: 2.h),
                        CustomText(
                          text: Utils.formatDate(order.createdAt.toString()),
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOrderItems(List<dynamic> items) {
    return items.map<Widget>((item) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          children: [
            Container(
              width: 4.r,
              height: 4.r,
              decoration: const BoxDecoration(
                color: AppColors.klineargradient1,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: CustomText(
                text: '${item['quantity']}x ${item['name']}',
                fontsize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            CustomText(
              text: '\$${item['price']}',
              fontsize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.klineargradient1,
            ),
          ],
        ),
      );
    }).toList();
  }
}
