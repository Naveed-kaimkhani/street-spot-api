import 'package:StreetSpot/controller/order_controller.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
   final OrderController controller = Get.put(OrderController());


  final List<Map<String, dynamic>> _orders = [
    {
      "id": 1,
      "created_at": "2025-09-22T12:03:27.000Z",
      "updated_at": "2025-09-22T12:20:00.000Z",
      "user_id": 2,
      "truck_id": 1,
      "original_amount": "20.00",
      "paid_amount": "20.00",
      "status": "COMPLETED",
      "estimate_preparation_time": 10,
      "items": [
        {"name": "Spicy Burger", "quantity": 2, "price": "8.00"},
        {"name": "French Fries", "quantity": 1, "price": "4.00"}
      ],
      "truck": {
        "truck_name": "Burger Express",
        "cuisine_type": "American",
        "average_rating": "4.0",
      },
      "user": {
        "username": "John Doe",
        "email": "john@example.com",
      }
    },
    {
      "id": 2,
      "created_at": "2025-09-22T12:04:17.000Z",
      "updated_at": "2025-09-22T12:04:17.000Z",
      "user_id": 2,
      "truck_id": 1,
      "original_amount": "15.00",
      "paid_amount": "15.00",
      "status": "PREPARING",
      "estimate_preparation_time": 15,
      "items": [
        {"name": "Chicken Wrap", "quantity": 1, "price": "10.00"},
        {"name": "Soda", "quantity": 1, "price": "5.00"}
      ],
      "truck": {
        "truck_name": "Taco Truck",
        "cuisine_type": "Mexican",
        "average_rating": "4.5",
      },
      "user": {
        "username": "Jane Smith",
        "email": "jane@example.com",
      }
    },
    {
      "id": 3,
      "created_at": "2025-09-22T11:00:00.000Z",
      "updated_at": "2025-09-22T11:00:00.000Z",
      "user_id": 3,
      "truck_id": 2,
      "original_amount": "25.00",
      "paid_amount": "25.00",
      "status": "WAITING_APPROVAL",
      "estimate_preparation_time": 0,
      "items": [
        {"name": "Pizza Slice", "quantity": 3, "price": "18.00"},
        {"name": "Garlic Bread", "quantity": 1, "price": "7.00"}
      ],
      "truck": {
        "truck_name": "Pizza Corner",
        "cuisine_type": "Italian",
        "average_rating": "4.2",
      },
      "user": {
        "username": "Mike Johnson",
        "email": "mike@example.com",
      }
    }
  ];

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

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString).toLocal();
      return DateFormat('MMM dd, yyyy • hh:mm a').format(date);
    } catch (e) {
      return dateString;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'COMPLETED':
        return AppColors.greenColor;
      case 'PREPARING':
        return AppColors.klineargradient1;
      case 'WAITING_APPROVAL':
        return AppColors.yellowColor;
      default:
        return AppColors.greyColor;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'COMPLETED':
        return 'Completed';
      case 'PREPARING':
        return 'Preparing';
      case 'WAITING_APPROVAL':
        return 'Pending Approval';
      default:
        return status;
    }
  }

  Widget _buildStatusIndicator(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _getStatusColor(status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: _getStatusColor(status), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.r,
            height: 8.r,
            decoration: BoxDecoration(
              color: _getStatusColor(status),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          CustomText(
            text: _getStatusText(status),
            fontsize: 12.sp,
            fontWeight: FontWeight.w600,
            color: _getStatusColor(status),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, int index) {
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
          onTap: () {
            // Navigate to order details
            // Get.toNamed(AppRouteName.orderDetailScreen, arguments: order);
          },
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
                            text:
                                order['truck']['truck_name'] ?? 'Unknown Truck',
                            fontsize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: order['truck']['cuisine_type'] ?? '',
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.APP_GRAY_COLOR,
                          ),
                        ],
                      ),
                    ),
                    _buildStatusIndicator(order['status']),
                  ],
                ),

                SizedBox(height: 16.h),

                // Order items
                ..._buildOrderItems(order['items'] ?? []),

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
                          text: '\$${order['paid_amount']}',
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
                          text: _formatDate(order['created_at']),
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

  Widget _buildTabButton(int index, String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          height: 40.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: _selectedTab == index
                ? AppColors.klineargradient1
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: _selectedTab == index
                  ? AppColors.klineargradient1
                  : AppColors.LIGHT_GREY_COLOR,
              width: 1,
            ),
          ),
          child: Center(
            child: CustomText(
              text: text,
              fontsize: 14.sp,
              fontWeight: FontWeight.w600,
              color: _selectedTab == index
                  ? Colors.white
                  : AppColors.APP_GRAY_COLOR,
            ),
          ),
        ),
      ),
    );
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
      body: Column(
        children: [
          // Status Tabs
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: _statusTabs.asMap().entries.map((entry) {
                return _buildTabButton(entry.key, entry.value);
              }).toList(),
            ),
          ),

          SizedBox(height: 16.h),

          // Orders List
          Expanded(
            child: _orders.isEmpty
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
                      children: _orders.asMap().entries.map((entry) {
                        return _buildOrderCard(entry.value, entry.key);
                      }).toList(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// CustomText widget (assuming you have this based on your home screen)
class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final bool isLeftAlign;
  final List<Color>? gradientColors;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontsize,
    required this.fontWeight,
    required this.color,
    this.textAlign = TextAlign.left,
    this.isLeftAlign = true,
    this.gradientColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
