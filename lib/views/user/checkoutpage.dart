import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart' show CustomButton;
import 'package:StreetSpot/custom_widgets/custom_text.dart' show CustomText;
import 'package:StreetSpot/routes/route_name.dart' show AppRouteName;
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  // Sample list of delivery addresses
  final List<Map<String, String>> deliveryAddresses = [
    {
      'name': 'Hassam Ahmed',
      'address': '123 Main St, Lahore, Pakistan',
    },
    {
      'name': 'Ali Khan',
      'address': '456 Park Ave, Karachi, Pakistan',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
        title: const CustomText(
          text: 'Checkout',
          fontsize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.plusJakartaSansExtraBold,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Item Ordered Section
                      const Text(
                        'Item Ordered',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Container(
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
                              child: Image.asset(
                                'assets/images/burgerimg.png',
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Smoky BBQ Burger',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'x4',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$12.20',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.pink),
                                      ),
                                      Text(
                                        '\$48.80',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // Details Transaction Section
                      const Text(
                        'Details Transaction',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Container(
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
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Chery Healthy',
                                    style: TextStyle(fontSize: 14)),
                                Text('\$480.80',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Driver', style: TextStyle(fontSize: 14)),
                                Text('Free',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.green)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tax 10%', style: TextStyle(fontSize: 14)),
                                Text('- \$0.00',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red)),
                              ],
                            ),
                            Divider(thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Price',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text('\$48.80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.klineargradient1)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // Deliver To Section (Dynamic)
                      const Text(
                        'Deliver To',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Container(
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
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name', style: TextStyle(fontSize: 14)),
                                Text('Albert Stevano',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Phone No.',
                                    style: TextStyle(fontSize: 14)),
                                Text('+12 8347 2838 28',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Address', style: TextStyle(fontSize: 14)),
                                Text('New York',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('House No',
                                    style: TextStyle(fontSize: 14)),
                                Text('BC54 Berlin',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('City', style: TextStyle(fontSize: 14)),
                                Text('New York City',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Divider(thickness: 1),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // Note Input Field
                      const Text(
                        'Note',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Container(
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
                        child: const TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Add a note for the restaurant...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 100.h), // Extra space for sticky button
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Sticky Checkout Now Button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CustomButton(
                // height: 40.h,
                buttonColor: Colors.orange,
                onTap: () {
                  Get.toNamed(AppRouteName.CHECKOUTs_SCREEN_ROUTE);
                  // AppNavigation.navigateCloseDialog(context);
                },
                buttonText: "Checkout Now",
                fontSize: 14.sp,
                borderRadius: 20,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
