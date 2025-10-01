import 'package:StreetSpot/controller/auth_controller.dart';
import 'package:StreetSpot/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/routes/route_name.dart' show AppRouteName;
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final AuthController authController = Get.find<AuthController>();
  @override
  void dispose() {
    authController.passwordController.clear();
    authController.confirmPasswordController.clear();
    super.dispose();
  }

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h), // Space from the top
            Text(
              'Reset Your Password',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                // color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 30.h),
            TextFormField(
              controller: authController.passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            TextFormField(
              controller: authController.confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                hintText: 'Confirm your password',
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            // Spacer(), // Pushes the button to the bottom
            CustomButton(
              buttonColor: Colors.orange,
              onTap: () => resetPassword(),
              isLoading: authController.isLoading,
              buttonText: 'Reset',
              fontSize: 14.sp,
              borderRadius: 20,
              fontFamily: AppFonts.plusJakartaSansRegular,
            ),
            SizedBox(height: 20.h), // Space at the bottom
          ],
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    final password = authController.passwordController.text.trim();

    final confirmPassword =
        authController.confirmPasswordController.text.trim();

    // ✅ Basic validation
    if (password.isEmpty) {
      // Get.snackbar("Error", "Email is required");
      AppSnackbar.error("Password is required");
      return;
    }

    if (confirmPassword.isEmpty) {
      AppSnackbar.error("Confirm Password is required");
      return;
    }

    if (password.length < 6) {
      AppSnackbar.error("Password must be at least 6 characters");
      return;
    }
    if (password.length < 6) {
      AppSnackbar.error("Password must be at least 6 characters");
      return;
    }
    if (password != confirmPassword) {
      AppSnackbar.error("Password does not match");
      return;
    }
    // ✅ Call API
    authController.resetPassword(
      otp: '',
      email: "kknav@gmail.com",
      newPassword: password,
    );
  }
}
