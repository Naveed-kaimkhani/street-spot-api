import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart' show CustomButton;
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class Customerinteractionscreen extends StatelessWidget {
  const Customerinteractionscreen({super.key});

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
          text: 'Customer Interaction',
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer Reviews Section
            CustomText(
              text: 'Customer Reviews',
              fontsize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'John Doe',
                        fontsize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      CustomText(
                        text: 'July 11, 2025',
                        fontsize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomText(
                    text: 'Great food and service!',
                    fontsize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.APP_GRAY_COLOR,
                  ),
                  SizedBox(height: 6.h),
                  RatingBar.builder(
                    initialRating: 4.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // Handle rating update if needed
                    },
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Type your reply...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomButton(
                      height: 32.h,
                      buttonColor: Colors.green,
                      onTap: () {
                        Get.toNamed(AppRouteName.customerinteraction);
                        // Handle Add Menu Item
                      },
                      buttonText: 'Reply',
                      fontSize: 14.sp,
                      borderRadius: 20,
                      fontFamily: AppFonts.plusJakartaSansRegular,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Promotion Offers Section
            CustomText(
              text: 'Promotion Offers',
              fontsize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Taco Tuesday – 20% Off',
                    fontsize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: 'Active: Every Tuesday, 11AM–3PM',
                    fontsize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'Remove',
                        fontsize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Buy 1 Get 1 Free \– Drinks',
                    fontsize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: 'Active: June 1–10',
                    fontsize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'Remove',
                        fontsize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Add New Promotion Section
            CustomText(
              text: '+ Add New Promotion',
              fontsize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Offer Tittle',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Promotion Details',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Start Date',
                        fontsize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          // Handle selected date
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black, // Text color
                          side: const BorderSide(
                              color: Colors
                                  .grey), // Optional: Add border for visibility
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const CustomText(
                          text: 'Select Date',
                          fontsize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black, // Ensure text color matches
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'End Date',
                        fontsize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          // Handle selected date
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black, // Text color
                          side: const BorderSide(
                              color: Colors
                                  .grey), // Optional: Add border for visibility
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const CustomText(
                          text: 'Select Date',
                          fontsize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black, // Ensure text color matches
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: CustomButton(
                // height: 32.h,
                buttonColor: Colors.green,
                onTap: () {
                  Get.toNamed(AppRouteName.customerinteraction);
                  // Handle Add Menu Item
                },
                buttonText: 'Save Promotion',
                fontSize: 14.sp,
                borderRadius: 20,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
