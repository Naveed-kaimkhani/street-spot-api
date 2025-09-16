import 'dart:io';

import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:StreetSpot/custom_widgets/day_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:StreetSpot/views/seller/locationscreen.dart'
    show Locationscreen;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TruckOwnerProfileScreen extends StatefulWidget {
  const TruckOwnerProfileScreen({super.key});

  @override
  State<TruckOwnerProfileScreen> createState() =>
      _TruckOwnerProfileScreenState();
}

class _TruckOwnerProfileScreenState extends State<TruckOwnerProfileScreen> {
  final controller = Get.find<TruckController>();
  @override
  void dispose() {
    super.dispose();
  }

  // Future<void> _selectTime(
  //     BuildContext context, TextEditingController controller) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       controller.text = picked.format(context); // e.g., 2:30 PM
  //     });
  //   }
  // }



// Future<void> _selectTime(
//     BuildContext context, TextEditingController controller) async {
//   if (Platform.isIOS) {
//     // Cupertino style picker
//     await showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 250,
//           color: Colors.white,
//           child: CupertinoDatePicker(
//             mode: CupertinoDatePickerMode.time,
//             initialDateTime: DateTime.now(),
//             use24hFormat: false,
//             onDateTimeChanged: (DateTime dateTime) {
//                  HapticFeedback.selectionClick();

//               final hh = dateTime.hour.toString().padLeft(2, '0');
//               final mm = dateTime.minute.toString().padLeft(2, '0');
//               controller.text = "$hh:$mm"; // HH:mm
              
//             },
//           ),
//         );
//       },
//     );
//   } else {
//     // Material style picker
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       controller.text = picked.format(context);
//     }
//   }
// }

Future<void> _selectTime(
    BuildContext context, TextEditingController controller) async {
  if (Platform.isIOS) {
    DateTime selectedTime = DateTime.now();

    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              // Toolbar with Cancel / Done
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Text("Done"),
                      onPressed: () {
                        final hh = selectedTime.hour.toString().padLeft(2, '0');
                        final mm =
                            selectedTime.minute.toString().padLeft(2, '0');
                        controller.text = "$hh:$mm"; // HH:mm
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: DateTime.now(),
                  use24hFormat: true, // 24h format
                  onDateTimeChanged: (DateTime dateTime) {
                    HapticFeedback.selectionClick();
                    selectedTime = dateTime; // store temporary selection
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  } else {
    // Material style picker
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final hh = picked.hour.toString().padLeft(2, '0');
      final mm = picked.minute.toString().padLeft(2, '0');
      controller.text = "$hh:$mm"; // HH:mm
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 38.0, right: 38, bottom: 20),
      //   // child: CustomButton(
      //   //   buttonColor: Colors.green,
      //   //   onTap: () {
      //   //     // save logic
      //   //   },
      //   //   buttonText: 'Save',
      //   //   fontSize: 14.sp,
      //   //   borderRadius: 20,
      //   //   fontFamily: AppFonts.plusJakartaSansRegular,
      //   // ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: const CustomText(
          text: 'Truck Owner Profile',
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              // Profile Picture and Name
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Limits the column height to its children
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Ensures horizontal centering
                  children: [
                    Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFEF2F2), // Placeholder color
                        ),
                        child: Image.asset("assets/images/Alice.png")),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: 'Arya Muller', // Placeholder name
                      fontsize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    SizedBox(
                        height: 12.h), // Added spacing between name and stats
                    CustomText(
                      text: 'Overview Stats',
                      fontsize: 14.sp,
                      fontWeight: FontWeight.w600,
                      gradientColors: const [
                        AppColors.klineargradient1,
                        AppColors.klineargradient2
                      ],
                    ),
                  ],
                ),
              ),

              // Overview Stats

              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // Vertical shadow
                        ),
                      ], // Elevation effect
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/followers.png",
                          height: 20.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 8.w),
                        CustomText(
                          text: '1k Followers',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // Vertical shadow
                        ),
                      ], // Elevation effect
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Vector.png",
                          height: 20.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 8.w),
                        CustomText(
                          text: '1000 USD Daily Sales',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              // Truck Information Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '🚚 Truck Information',
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                   InkWell(
                     child: CustomText(
                        text: 'Add Menu',
                        fontsize: 14.sp,
                        fontWeight: FontWeight.w600,
                        gradientColors: const [
                          AppColors.klineargradient1,
                          AppColors.klineargradient2
                        ],
                      ),
                      onTap: () {},
                   ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Truck Name',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.truckName,
                      decoration: InputDecoration(
                        hintText: 'Truck name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'Select Cuisine Type',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    // DropdownButtonFormField<String>(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(8.r),
                    //       borderSide: const BorderSide(color: Colors.grey),
                    //     ),
                    //     contentPadding:
                    //         EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                    //   ),
                    //   value: controller.selectedCuisine.value,
                    //   hint: CustomText(
                    //     text: 'Select Cuisine',
                    //     fontsize: 12.sp,
                    //     fontWeight: FontWeight.w400,
                    //     color: Colors.grey,
                    //   ),
                    //   items: <String>['American', 'Italian', 'Mexican', 'Asian']
                    //       .map((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: CustomText(
                    //         text: value,
                    //         fontsize: 12.sp,
                    //         fontWeight: FontWeight.w400,
                    //         color: Colors.black,
                    //       ),
                    //     );
                    //   }).toList(),
                    //   onChanged: (String? newValue) {
                    //     if (newValue != null) {
                    //       controller.setCuisine(newValue);
                    //     }
                    //   },
                    // ),
                    Obx(() => DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 12.w),
                          ),
                          value: controller.selectedCuisine.value!.isEmpty
                              ? null
                              : controller.selectedCuisine
                                  .value, // ✅ handles default state
                          hint: CustomText(
                            text: 'Select Cuisine',
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          items: <String>[
                            'American',
                            'Italian',
                            'Mexican',
                            'Asian'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(
                                text: value,
                                fontsize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.setCuisine(newValue);
                            }
                          },
                        )),

                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'Start Time',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.startTimeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Select Start Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                      onTap: () =>
                          _selectTime(context, controller.startTimeController),
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'End Time',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.endTimeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Select End Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                      onTap: () =>
                          _selectTime(context, controller.endTimeController),
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'Phone Number',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'Email Address',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 24.h),
              // Your Menu Items Section
              // CustomText(
              //   text: '🍔 Your Menu Items',
              //   fontsize: 14.sp,
              //   fontWeight: FontWeight.w600,
              //   color: Colors.black,
              // ),
              // SizedBox(height: 12.h),
              // Container(
              //   padding: EdgeInsets.all(12.w),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(8.r),
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               CustomText(
              //                 text: 'Smoky BBQ Burger',
              //                 fontsize: 12.sp,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.black,
              //               ),
              //               SizedBox(height: 4.h),
              //               CustomText(
              //                 text: '\$19.99',
              //                 fontsize: 12.sp,
              //                 fontWeight: FontWeight.w400,
              //                 color: Colors.black,
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               GestureDetector(
              //                 onTap: () {
              //                   // Handle Edit
              //                 },
              //                 child: CustomText(
              //                   text: 'Edit',
              //                   fontsize: 12.sp,
              //                   fontWeight: FontWeight.w400,
              //                   color: Colors.blue,
              //                 ),
              //               ),
              //               SizedBox(width: 12.w),
              //               GestureDetector(
              //                 onTap: () {
              //                   // Handle Delete
              //                 },
              //                 child: CustomText(
              //                   text: 'Delete',
              //                   fontsize: 12.sp,
              //                   fontWeight: FontWeight.w400,
              //                   color: Colors.red,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 12.h),
              //       CustomButton(
              //         buttonColor: Colors.green,
              //         onTap: () {
              //           // Handle Add Menu Item
              //         },
              //         buttonText: 'Add Menu Item',
              //         fontSize: 14.sp,
              //         borderRadius: 20,
              //         fontFamily: AppFonts.plusJakartaSansRegular,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 24.h),
              // Weekly Location Schedule Section
              CustomText(
                text: '📍 Weekly Location Schedule',
                fontsize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomText(
                    //   text: 'Monday',
                    //   fontsize: 12.sp,
                    //   fontWeight: FontWeight.w600,
                    //   color: Colors.black,
                    // ),
                    Obx(() => DayDropdown(
                          selectedDay: controller.selectedDay.value,
                          onChanged: (value) {
                            if (value != null) controller.setDay(value);
                          },
                        )),

                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.mondayLocationController,
                      decoration: InputDecoration(
                        hintText: 'Enter location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'Start Time',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.weeklyStartTime,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Select Start Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                      onTap: () =>
                          _selectTime(context, controller.weeklyStartTime),
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'End Time',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.weeklyEndTime,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Select End Time',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                      ),
                      onTap: () =>
                          _selectTime(context, controller.weeklyEndTime),
                    ),
                    SizedBox(height: 16.h),
                    // ➕ Add schedule button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:  88.0,),
                      child: CustomButton(
                        buttonColor: Colors.blue,
                        onTap: () => controller.addSchedule(),
                        buttonText: "Add Schedule",
                  
                fontSize: 14.sp,
                borderRadius: 20,
                        fontFamily: AppFonts.plusJakartaSansRegular,
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Checkbox(
                    //       value: controller.enableManualLocation.value,
                    //       onChanged: (value) {
                    //         // setState(() {
                    //         //   enableManualLocation = value ?? false;
                    //         //   if (enableManualLocation) {
                    //         //     Navigator.push(
                    //         //       context,
                    //         //       MaterialPageRoute(
                    //         //         builder: (context) => const Locationscreen(),
                    //         //       ),
                    //         //     );
                    //         //   }
                    //         // // });
                    //         // controller.se
                    //       },
                    //       activeColor: Colors.blue,
                    //     ),
                    //     Expanded(
                    //       child: CustomText(
                    //         text: 'Enable Manual Location Entry',
                    //         fontsize: 12.sp,
                    //         fontWeight: FontWeight.w400,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Select Rating/Health Section
              CustomText(
                text: 'Select Rating/Health',
                fontsize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(height: 12.h),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: ['A', 'B', 'C', 'D'].map((rating) {
              //       controller.selectedRating.value = rating;
              //     return GestureDetector(
              //       onTap: () {
              //         // setState(() {
              //         //   selectedRating = rating;
              //         // });
              //         controller.setRating(controller.selectedRating.value);
              //       },
              //       child: Container(
              //         padding:
              //             EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.grey),
              //           borderRadius: BorderRadius.circular(8.r),
              //           gradient: controller.selectedRating.value
              //               ? const LinearGradient(
              //                   colors: [
              //                     AppColors.klineargradient1,
              //                     AppColors.klineargradient2
              //                   ],
              //                   begin: Alignment.topLeft,
              //                   end: Alignment.bottomRight,
              //                 )
              //               : null,
              //         ),
              //         child: CustomText(
              //           text: rating,
              //           fontsize: 14.sp,
              //           fontWeight: FontWeight.w600,
              //           color: isSelected ? Colors.white : Colors.black,
              //         ),
              //       ),
              //     );
              //   }).toList(),
              // ),
              Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['A', 'B', 'C', 'D'].map((rating) {
                      bool isSelected =
                          controller.selectedRating.value == rating;
                      return GestureDetector(
                        onTap: () => controller.setRating(rating),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.r),
                            gradient: isSelected
                                ? const LinearGradient(
                                    colors: [
                                      AppColors.klineargradient1,
                                      AppColors.klineargradient2
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                          ),
                          child: CustomText(
                            text: rating,
                            fontsize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  )),

              SizedBox(height: 12.h),
              
              SizedBox(height: 24.h),
              
              SizedBox(height: 24.h),
              
              SizedBox(height: 24.h),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 20),
              child: CustomButton(
                buttonColor: Colors.green,
                onTap: () {
                  // final error = validateTruckInfo();
                  // if (error != null) {
                  //   Get.snackbar("Error", error, colorText: Colors.black);
                  //   return;
                  // }

                  // // ✅ safe to proceed
                  // controller.submitTruckInfo();
                  
                  controller.submitTruckInfo();
                },
                buttonText: 'Save',
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

  String? validateTruckInfo() {
    if (controller.truckName.text.isEmpty) {
      return "Truck name is required";
    }
    if (controller.selectedCuisine.value.isEmpty) {
      return "Please select a cuisine";
    }
    if (controller.emailController.text.isEmpty) {
      return "Email is required";
    }
    // optional: basic email format check
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(controller.emailController.text)) {
      return "Please enter a valid email";
    }
    if (controller.startTimeController.text.isEmpty ||
        controller.endTimeController.text.isEmpty) {
      return "Start and end time are required";
    }
      if (controller.weeklySchedules.isEmpty) {
      return "Please add atleast one weekly day";
    }
    return null; // ✅ no error
  }
}
