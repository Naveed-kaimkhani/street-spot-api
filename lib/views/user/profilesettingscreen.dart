import 'package:StreetSpot/controller/user_controller.dart' show UserController;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/custom_widgets/custom_text.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class Profilesettingscreen extends StatefulWidget {
  const Profilesettingscreen({super.key});

  @override
  State<Profilesettingscreen> createState() => _ProfilesettingscreenState();
}

class _ProfilesettingscreenState extends State<Profilesettingscreen> {
  
 final userController = Get.put(UserController());
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
          text: 'Profile Settings',
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          isLeftAlign: false, // Center the AppBar title
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          // Profile Picture and Name
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle,
                  color: const Color(0xffFEF2F2),
                ),
                child: const Icon(
                  Icons.image,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: 'John Doe',
                fontsize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.center,
                isLeftAlign: false, // Ensure centering
              ),
              SizedBox(height: 12.h),
              CustomText(
                text: 'john.doe@example.com',
                fontsize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.APP_GRAY_COLOR,
                textAlign: TextAlign.center,
                isLeftAlign: false, // Ensure centering
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // My Orders Section
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
                  text: 'My Orders',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Order ID: #12345',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.klineargradient1,
                            AppColors.klineargradient2,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CustomText(
                        text: 'In Progress',
                        fontsize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Image.asset("assets/images/profileresimage.png"),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Smoky BBQ Burger',
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '\$19.99',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: [
                                    AppColors.klineargradient1,
                                    AppColors.klineargradient2
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(const Rect.fromLTWH(0, 0, 200, 20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      text: '14 items',
                      fontsize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          // Profile Section
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
                  text: 'Profile',
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteName.personalinformation);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColors.blackColor,
                              size: 16.sp,
                            ),
                            SizedBox(width: 8.w),
                            CustomText(
                              text: 'Personal Information',
                              fontsize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.blackColor,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade300, height: 0),
                GestureDetector(
                  onTap: () {
                    // Handle Settings action
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: AppColors.blackColor,
                              size: 16.sp,
                            ),
                            SizedBox(width: 8.w),
                            CustomText(
                              text: 'Settings',
                              fontsize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.blackColor,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.grey.shade300, height: 0),
                GestureDetector(
                  onTap: () {
                    // Handle Help Center action
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: AppColors.blackColor,
                              size: 16.sp,
                            ),
                            SizedBox(width: 8.w),
                            CustomText(
                              text: 'Help Center',
                              fontsize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.blackColor,
                          size: 16.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            buttonColor: Colors.orange,
            onTap: () {
          userController.logout();

            },
            buttonText: 'Sign Out',
            fontSize: 14.sp,
            borderRadius: 20,
            fontFamily: AppFonts.plusJakartaSansRegular,
          ),
        ],
      ),
    );
  }
}