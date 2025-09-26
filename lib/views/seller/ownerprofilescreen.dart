import 'dart:io';
import 'dart:math';
import 'package:StreetSpot/components/weekday_dropdown.dart';
import 'package:StreetSpot/controller/homcontroller.dart';
import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/custom_widgets/day_dropdown.dart';
import 'package:StreetSpot/repositries/auth_repo.dart';
import 'package:StreetSpot/repositries/truck_repository.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class TruckOwnerProfileScreen extends StatefulWidget {
  const TruckOwnerProfileScreen({super.key});

  @override
  State<TruckOwnerProfileScreen> createState() =>
      _TruckOwnerProfileScreenState();
}

class _TruckOwnerProfileScreenState extends State<TruckOwnerProfileScreen> {
  final controller = Get.put(
      TruckController(truckRepo: TruckRepository(apiClient: Get.find())));
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  final DashboardController dashboardController =
      Get.find<DashboardController>();

  final UserController userController = Get.find<UserController>();
  @override
  void dispose() {
    super.dispose();
  }

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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          final hh =
                              selectedTime.hour.toString().padLeft(2, '0');
                          final mm =
                              selectedTime.minute.toString().padLeft(2, '0');
                          controller.text = "$hh:$mm";
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
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime dateTime) {
                      HapticFeedback.selectionClick();
                      selectedTime = dateTime;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null) {
        final hh = picked.hour.toString().padLeft(2, '0');
        final mm = picked.minute.toString().padLeft(2, '0');
        controller.text = "$hh:$mm";
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
            // Navigator.pop(context);
            Get.back();
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
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                // Profile Picture and Name
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFEF2F2),
                        ),
                        child: Image.asset("assets/images/Alice.png"),
                      ),
                      SizedBox(height: 12.h),
                      CustomText(
                        text: userController.currentUser!.name,
                        fontsize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      SizedBox(height: 12.h),
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
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
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
                            text:
                             '${dashboardController.dashboardData.value?.followersCount ?? 0} Followers',
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
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
                            text:
                                '${dashboardController.dashboardData.value?.todaySales ?? 0} USD Daily Sales',
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
                      onTap: () {
                  
                      if (userController.user.value?.truckInformation==null){
                        Get.snackbar("Error", "Please add truck information first", colorText: Colors.black);
                      }else{
                        Get.toNamed(AppRouteName.ADD_MEMU_ITEM);
                      }
                      },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Truck name is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: 'Select Cuisine Type',
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8.h),
                      Obx(() => DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 12.w),
                            ),
                            value: controller.selectedCuisine.value.isEmpty
                                ? null
                                : controller.selectedCuisine.value,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a cuisine';
                              }
                              return null;
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
                        onTap: () => _selectTime(
                            context, controller.startTimeController),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Start time is required';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'End time is required';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
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
                      
                      WeekdayDropdown(),
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
                        validator: (value) {
                          if (controller.weeklySchedules.isEmpty) {
                            return 'Location is required';
                          }
                          return null;
                        },
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
                        validator: (value) {
                        if (controller.weeklySchedules.isEmpty) {
                            return 'Weekly Schedule is required';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (controller.weeklySchedules.isEmpty) {
                            return 'Weekly Schedule is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 88.0),
                        child: CustomButton(
                          buttonColor: Colors.blue,
                          onTap: () => controller.addSchedule(),
                          buttonText: "Add Schedule",
                          fontSize: 14.sp,
                          borderRadius: 20,
                          fontFamily: AppFonts.plusJakartaSansRegular,
                        ),
                      ),
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 20),
              child: CustomButton(
                isLoading: controller.isLoading,
                buttonColor: Colors.green,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (controller.weeklySchedules.isEmpty) {
                      Get.snackbar(
                          "Error", "Please add at least one weekly day",
                          colorText: Colors.black);
                      return;
                    }
                    
                    controller.submitTruckInfo();
                  }

                  // }
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
}
