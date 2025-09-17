import 'dart:io';

import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddMenuItemScreen extends StatefulWidget {
  const AddMenuItemScreen({super.key});

  @override
  State<AddMenuItemScreen> createState() => _AddMenuItemScreenState();
}

class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
  final controller = Get.find<TruckController>();
  File? profilePhoto;
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profilePhoto = File(pickedFile.path);
      });
    }
  }

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
        title: const CustomText(
          text: 'Add Menu Items',
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
              // Overview Stats
              SizedBox(height: 24.h),
              // Truck Information Section
              Stack(
                alignment: Alignment.center,
                children: [
                  // GestureDetector(
                  //   onTap: pickImage,
                  //   child: CircleAvatar(
                  //     radius: 50, // bigger radius for food image
                  //     backgroundColor: Colors.grey[300],
                  //     child: Stack(
                  //       children: [
                  //         if (profilePhoto != null)
                  //           ClipOval(
                  //             child: Image.file(
                  //               profilePhoto!,
                  //               width: 100, // match roughly 2 * radius
                  //               height: 100,
                  //               fit: BoxFit.cover, // crop to fit nicely
                  //             ),
                  //           )
                  //         else
                  //           const Icon(
                  //             Icons.fastfood, // better food placeholder
                  //             size: 40,
                  //             color: Colors.white,
                  //           ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: 140, // wider
                      height: 120, // slightly shorter for food look
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            BorderRadius.circular(16), // rounded corners
                      ),
                      child: profilePhoto != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                profilePhoto!,
                                width: 140,
                                height: 120,
                                fit: BoxFit.cover, // fill & crop nicely
                              ),
                            )
                          : const Center(
                              child: Icon(
                                Icons.fastfood,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 24.h),
              CustomText(
                text: '🍽️ Menu Information', // Plate and utensils
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
                    CustomText(
                      text: 'Food Name',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.foodName,
                      decoration: InputDecoration(
                        hintText: 'Food name',
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
                      text: 'Price',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.foodPrice,
                      decoration: InputDecoration(
                        hintText: 'Enter Price',
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
                      text: 'Delievery Time',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.foodDelievery,
                      decoration: InputDecoration(
                        hintText: 'Enter Delievery Time',
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
                      text: 'Description',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: controller.foodDescription,
                      decoration: InputDecoration(
                        hintText: 'Enter Description',
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

              SizedBox(height: 38.h),
              CustomButton(
                buttonColor: Colors.green,
                onTap: () {},
                buttonText: 'Save',
                fontSize: 14.sp,
                borderRadius: 20,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? validateTruckInfo() {
    if (controller.foodName.text.isEmpty) {
      return "Food name is required";
    }
    if (controller.foodPrice.text.isEmpty) {
      return "Food price is required";
    }

    if (controller.foodDescription.text.isEmpty) {
      return "Please add food description";
    }
    if (controller.foodDelievery.text.isEmpty) {
      return "Please add food delivery time";
    }
    return null; // ✅ no error
  }
}
