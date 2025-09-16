import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:get/get.dart';

class SellerNotificationscreen extends StatefulWidget {
  const SellerNotificationscreen({super.key});

  @override
  State<SellerNotificationscreen> createState() =>
      _SellerNotificationscreenState();
}

class _SellerNotificationscreenState extends State<SellerNotificationscreen> {
  int _selectedCategory = 0; // 0: All, 1: Feedback, 2: Subscription, 3: System

  final List<Map<String, String>> _allNotifications = [
    {
      'title': 'New Order Received',
      'subtitle': 'You have a new order from John Doe',
      'time': '06:30 AM'
    },
    {
      'title': 'Promotion Started',
      'subtitle': 'Summer Discount is now live',
      'time': '06:00 AM'
    },
    {
      'title': 'Feedback Received',
      'subtitle': 'New feedback from a customer',
      'time': '05:45 AM'
    },
    {
      'title': 'System Update',
      'subtitle': 'App updated to version 2.0',
      'time': '05:30 AM'
    },
  ];

  final List<Map<String, String>> _feedbackNotifications = [
    {
      'title': 'Feedback Received',
      'subtitle': 'Great food! - John Doe',
      'time': '05:45 AM'
    },
    {
      'title': 'Feedback Received',
      'subtitle': 'Needs improvement - Jane Smith',
      'time': '04:30 AM'
    },
  ];

  final List<Map<String, String>> _subscriptionNotifications = [
    {
      'title': 'Subscription Renewed',
      'subtitle': 'Your plan is active until Aug 2025',
      'time': '06:00 AM'
    },
    {
      'title': 'Payment Due',
      'subtitle': 'Renew your subscription by Jul 20',
      'time': '05:00 AM'
    },
  ];

  final List<Map<String, String>> _systemNotifications = [
    {
      'title': 'System Update',
      'subtitle': 'App updated to version 2.0',
      'time': '05:30 AM'
    },
    {
      'title': 'Maintenance Scheduled',
      'subtitle': 'Server maintenance at 2 AM',
      'time': '04:00 AM'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: CustomText(
          text: 'Notification',
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => _selectedCategory = 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: _selectedCategory == 0
                          ? Color(0xffDBEAFE)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CustomText(
                      text: 'All',
                      fontsize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          _selectedCategory == 0 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _selectedCategory = 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: _selectedCategory == 1
                          ? Color(0xffDBEAFE)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CustomText(
                      text: 'Feedback',
                      fontsize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          _selectedCategory == 1 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _selectedCategory = 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: _selectedCategory == 2
                          ? Color(0xffDBEAFE)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CustomText(
                      text: 'Subscription',
                      fontsize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          _selectedCategory == 2 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _selectedCategory = 3),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: _selectedCategory == 3
                          ? Color(0xffDBEAFE)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CustomText(
                      text: 'System',
                      fontsize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          _selectedCategory == 3 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _getNotifications().length,
              itemBuilder: (context, index) {
                final notification = _getNotifications()[index];
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteName.PAYMENT_SCREEN_ROUTE);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: const BoxDecoration(
                                color: Color(0xffDBEAFE),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.search,
                                  color: Colors.blue, size: 20.0),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: notification['title']!,
                                    fontsize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(height: 4.0),
                                  CustomText(
                                    text: notification['subtitle']!,
                                    fontsize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            CustomText(
                              text: notification['time']!,
                              fontsize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> _getNotifications() {
    switch (_selectedCategory) {
      case 1:
        return _feedbackNotifications;
      case 2:
        return _subscriptionNotifications;
      case 3:
        return _systemNotifications;
      default:
        return _allNotifications;
    }
  }
}

final List<Map<String, String>> _allNotifications = [
  {
    'title': 'New Order Received',
    'subtitle': 'You have a new order from John Doe',
    'time': '06:30 AM'
  },
  {
    'title': 'Promotion Started',
    'subtitle': 'Summer Discount is now live',
    'time': '06:00 AM'
  },
  {
    'title': 'Feedback Received',
    'subtitle': 'New feedback from a customer',
    'time': '05:45 AM'
  },
  {
    'title': 'System Update',
    'subtitle': 'App updated to version 2.0',
    'time': '05:30 AM'
  },
];

final List<Map<String, String>> _feedbackNotifications = [
  {
    'title': 'Feedback Received',
    'subtitle': 'Great food! - John Doe',
    'time': '05:45 AM'
  },
  {
    'title': 'Feedback Received',
    'subtitle': 'Needs improvement - Jane Smith',
    'time': '04:30 AM'
  },
];

final List<Map<String, String>> _subscriptionNotifications = [
  {
    'title': 'Subscription Renewed',
    'subtitle': 'Your plan is active until Aug 2025',
    'time': '06:00 AM'
  },
  {
    'title': 'Payment Due',
    'subtitle': 'Renew your subscription by Jul 20',
    'time': '05:00 AM'
  },
];

final List<Map<String, String>> _systemNotifications = [
  {
    'title': 'System Update',
    'subtitle': 'App updated to version 2.0',
    'time': '05:30 AM'
  },
  {
    'title': 'Maintenance Scheduled',
    'subtitle': 'Server maintenance at 2 AM',
    'time': '04:00 AM'
  },
];
