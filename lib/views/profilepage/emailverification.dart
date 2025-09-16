import 'dart:developer';

import 'package:StreetSpot/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/routes/route_name.dart' show AppRouteName;
import 'package:StreetSpot/utils/app_colors.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({
    super.key,
    this.isFromForgotPassword = false,
    this.email,
  });

  final bool isFromForgotPassword;
  final String? email;

  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    void showSuccessPopup() {
      showDialog(
        context: Get.context!, // Using Get.context! for compatibility with GetX
        barrierDismissible: true, // Prevents closing by tapping outside
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(15.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.klineargradient1,
                          AppColors.klineargradient2,
                        ], // Gradient for the circle
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Icon(
                      Icons.check_circle,
                      size: 40.r,
                      color: Colors.white, // White checkmark
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Password Successfully Changed',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                border: Border.all(color: Colors.black),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 20.r,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.blue[200]!, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Verify Email',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'We Have Sent Code To Your Phone Number',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  "nav****@gmail.com",
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                ),
                SizedBox(height: 20.h),
                Pinput(
                  length: 4,
                  defaultPinTheme: pinTheme,
                  focusedPinTheme: pinTheme,
                  submittedPinTheme: pinTheme,
                  pinAnimationType: PinAnimationType.scale,
                  preFilledWidget: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.pink, Colors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.all(2.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            '',
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  followingPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    textStyle: TextStyle(fontSize: 20.sp, color: Colors.black),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onCompleted: (pin) {
                    // if (userController.user.value!.otp == pin) {
                    //   Get.snackbar("Success", "OTP Verified");
                    //   // proceed to next screen
                    // } else {
                    //   Get.snackbar("Error", "Invalid OTP");
                    // }
                    log(isFromForgotPassword.toString());
                    if (isFromForgotPassword) {
                      Get.toNamed(AppRouteName.Reset_SCREEN_ROUTE);
                    } else {
                      Get.toNamed(AppRouteName.BOTTOM_BAR_SCREEN_ROUTE);
                    }
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  '(02:30)',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  buttonColor: Colors.orange,
                  onTap: () {
                    showSuccessPopup();
                  },
                  buttonText: 'Verify',
                  fontSize: 14.sp,
                  borderRadius: 20,
                  fontFamily: AppFonts.plusJakartaSansRegular,
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    // Handle send again action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xffE3E3E3),
                    fixedSize: const Size(400, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
                  ),
                  child: Text(
                    'Send Again',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.plusJakartaSansRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSuccessPopup() {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 40.r,
                  color: Colors.green[700],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Success!',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Your email has been verified successfully.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Get.offNamed(AppRouteName.Reset_SCREEN_ROUTE);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: AppFonts.plusJakartaSansRegular,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
