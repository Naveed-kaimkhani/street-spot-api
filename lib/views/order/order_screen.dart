import 'dart:developer';

import 'package:StreetSpot/components/order_card_widget.dart';
import 'package:StreetSpot/components/orders_shimmer.dart';
import 'package:StreetSpot/controller/order_controller.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final OrderController controller = Get.find<OrderController>();

  final List<String> _statusTabs = ['All', 'Active', 'Completed', 'Cancelled'];
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
      // Delay the API call until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchOrders();
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        title: CustomText(
          text: 'My Orders',
          fontsize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.r, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) 
        // if (true) 
        
        {
          return OrdersShimmer();
        }

              if (controller.allOrders.isEmpty) {
                return const Center(child: Text("No trucks available"));
              }

        return          Column(
        children: [
          // Status Tabs
          // Container(
          //   color: Colors.white,
          //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          //   child: Row(
          //     children: _statusTabs.asMap().entries.map((entry) {
          //       return _buildTabButton(entry.key, entry.value);
          //     }).toList(),
          //   ),
          // ),

          SizedBox(height: 16.h),

          // Orders List
          Expanded(
            child: controller.allOrders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 80.r,
                          color: AppColors.LIGHT_GREY_COLOR,
                        ),
                        SizedBox(height: 16.h),
                        CustomText(
                          text: 'No orders yet',
                          fontsize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: 'Your orders will appear here',
                          fontsize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.APP_GRAY_COLOR,
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: controller.allOrders.asMap().entries.map((entry) {
                        return OrderCardWidget(order: entry.value,onStatusChanged: (newStatus) => controller.acceptOrder(entry.value.id),);
                      }).toList(),
                    ),
                  ),
          ),
        ],
      );
    })      
  
    );
  }
}

