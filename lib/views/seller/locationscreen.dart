import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart' show CustomButton;
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class Locationscreen extends StatelessWidget {
  const Locationscreen({super.key});

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
          text: 'Location Update',
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Real-Time Location Update',
                fontsize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.blue,
                  ),
                  const Expanded(
                    child: CustomText(
                      text: 'Enable GPS Tracking',
                      fontsize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const CustomText(
                    text: 'Auto-update your location with device GPS.',
                    fontsize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const CustomText(
                  text: 'Status: Waiting for permission...',
                  fontsize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              CustomText(
                text: 'Manual Location (if GPS is off)',
                fontsize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter city or address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                buttonColor: Colors.green,
                onTap: () {
                  Get.toNamed(AppRouteName.customerinteraction);
                  // Handle Add Menu Item
                },
                buttonText: 'Refresh Location',
                fontSize: 14.sp,
                borderRadius: 20,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
              const SizedBox(height: 16),
              CustomText(
                text: 'Map Preview',
                fontsize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/mapreview.png', // Placeholder image, replace with actual map URL
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              CustomText(
                text: '📜 Location History',
                fontsize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              const CustomText(
                text: '•      Downtown Market - 11:00 AM',
                fontsize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.APP_GRAY_COLOR,
              ),
              SizedBox(
                height: 6.h,
              ),
              const CustomText(
                text: '•      Main Street Park - 1:30 PM',
                fontsize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.APP_GRAY_COLOR,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
