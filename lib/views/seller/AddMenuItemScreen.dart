import 'dart:io';

import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/model/category_model.dart';
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
  TruckController controller = Get.find<TruckController>();
  UserController userController = Get.find<UserController>();
  File? profilePhoto;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadCategories();
    });
  }

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (profilePhoto == null) {
        Get.snackbar("Error", "Please upload a food image",
            colorText: Colors.black);
        return;
      }
      if (userController.truck == null) {
        Get.snackbar("info", "Create a truck first");
      } else {
        controller.addMenuItem(
            truckId: userController.truck!.id.toString(), file: profilePhoto!);
      }
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
          // Scrollable content
          ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              SizedBox(height: 24.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: profilePhoto != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                profilePhoto!,
                                width: 140,
                                height: 120,
                                fit: BoxFit.cover,
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
                text: '🍽️ Menu Information',
                fontsize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(height: 12.h),
              Form(
                key: _formKey,
                child: Container(
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
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Food name is required';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Price is required';
                          }
                          final price = double.tryParse(value.trim());
                          if (price == null || price <= 0) {
                            return 'Please enter a valid price';
                          }
                          return null;
                        },
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
                        text: 'Delivery Time',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: controller.foodDelievery,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Delivery time is required';
                          }
                          final time = int.tryParse(value.trim());
                          if (time == null || time <= 0) {
                            return 'Please enter a valid delivery time';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Delivery Time',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomText(
                        text: 'Category',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      Obx(() {
                        if (controller.isLoading.value &&
                            controller.categories.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (controller.categories.isEmpty) {
                          return const Text("No categories available");
                        }
                        return DropdownButtonFormField<CategoryModel>(
                          value: controller.selectedCategory.value,
                          items: controller.categories.map((cat) {
                            return DropdownMenuItem<CategoryModel>(
                              value: cat,
                              child: Text(cat.categoryName ?? "Unnamed"),
                            );
                          }).toList(),
                          onChanged: (cat) {
                            controller.selectedCategory.value = cat;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 12.w),
                          ),
                          validator: (value) =>
                              value == null ? "Please select a category" : null,
                        );
                      }),
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
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Description is required';
                          }
                          return null;
                        },
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
                      SizedBox(height: 16.h),
                      CustomText(
                        text: 'Discount Percentage',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        controller: controller.discountPercentage,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Discount Percentage is required';
                          }
                          final number = double.tryParse(value.trim());
                          if (number == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Discount Percentage',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 12.w),
                        ),
                      ),
                      SizedBox(
                          height: 50
                              .h), // Extra space to ensure button doesn't overlap content
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Sticky Save Button
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
            child: CustomButton(
              isLoading: controller.isLoading,
              buttonColor: Colors.green,
              onTap: _submitForm,
              buttonText: 'Save',
              fontSize: 14.sp,
              borderRadius: 20,
              fontFamily: AppFonts.plusJakartaSansRegular,
            ),
          ),
        ],
      ),
    );
  }
}
