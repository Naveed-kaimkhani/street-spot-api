import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/app_fonts.dart';

import 'package:intl/intl.dart'; // For date formatting

// Notification data model
class NotificationItem {
  final String title;
  final String message;
  final DateTime timestamp;

  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
  });
}

class NotificationScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    // Today (06:39 AM PKT, June 27, 2025)
    NotificationItem(
      title: 'New Order Placed',
      message: 'Your order #123 has been placed successfully.',
      timestamp: DateTime(2025, 6, 27, 6, 39),
    ),
    NotificationItem(
      title: 'Promotion Alert',
      message: 'Get 20% off on your next meal!',
      timestamp: DateTime(2025, 6, 27, 5, 15),
    ),
    // Yesterday (June 26, 2025)
    NotificationItem(
      title: 'Delivery Update',
      message: 'Your order #122 has been delivered.',
      timestamp: DateTime(2025, 6, 26, 14, 30),
    ),
    NotificationItem(
      title: 'Account Verified',
      message: 'Your account is now verified.',
      timestamp: DateTime(2025, 6, 26, 9, 00),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Group notifications by date
    final Map<String, List<NotificationItem>> groupedNotifications = {};
    for (var notification in notifications) {
      String dateKey =
          DateFormat('MMMM d, yyyy').format(notification.timestamp);
      if (DateTime.now().day == notification.timestamp.day &&
          DateTime.now().month == notification.timestamp.month &&
          DateTime.now().year == notification.timestamp.year) {
        dateKey = 'Today';
      } else if (DateTime.now().difference(notification.timestamp).inDays ==
          1) {
        dateKey = 'Yesterday';
      }
      groupedNotifications.putIfAbsent(dateKey, () => []).add(notification);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Navigate back when tapped
          },
          child: Container(
            margin: EdgeInsets.all(8.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black)),
            child: Icon(
              Icons.arrow_back,
              size: 20.r,
              color: Colors.black,
            ),
          ),
        ),
        title: CustomText(
          text: 'Notification',
          fontsize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.plusJakartaSansExtraBold,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15.w),
        itemCount: groupedNotifications.length,
        itemBuilder: (context, index) {
          String dateKey = groupedNotifications.keys.elementAt(index);
          List<NotificationItem> dateNotifications =
              groupedNotifications[dateKey]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: dateKey,
                fontsize: 14.0,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                fontFamily: AppFonts.plusJakartaSansExtraBold,
              ),
              SizedBox(height: 8.h),
              ...dateNotifications.map((notification) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10.h),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12.w),
                    leading: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: const AssetImage(
                          'assets/images/noticon.png'), // Replace with your image asset
                      backgroundColor: Colors.grey[200],
                    ),
                    title: CustomText(
                      text: notification.title,
                      fontsize: 14.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.plusJakartaSansExtraBold,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.h),
                        CustomText(
                          text: notification.message,
                          fontsize: 14.0,
                          fontFamily: AppFonts.plusJakartaSansLight,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: DateFormat('hh:mm a')
                              .format(notification.timestamp),
                          fontsize: 12.0,
                          fontFamily: AppFonts.plusJakartaSansLight,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
