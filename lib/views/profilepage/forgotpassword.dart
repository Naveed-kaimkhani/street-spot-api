import 'package:StreetSpot/controller/auth_controller.dart';
import 'package:StreetSpot/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/custom_widgets/custom_button.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final AuthController authController = Get.find<AuthController>();
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
              'Forget Password',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                // color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 30.h),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter your email address',
                prefixIcon: const Icon(Icons.email, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              '* We will send you a message to set or reset your new password',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60.h,
            ),
            // Spacer(), // Pushes the button to the bottom
            CustomButton(
              buttonColor: Colors.orange,
              onTap: () => forgetPassword(),
              isLoading: authController.isLoading,
              buttonText: 'Next',
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

  Future<void> forgetPassword() async {
    final email = controller.text.trim();

    if (email.isEmpty) {
      // Get.snackbar("Error", "Email is required");
      AppSnackbar.error("Email is required");
      return;
    }

    if (!GetUtils.isEmail(email)) {
      // Get.snackbar("Error", "Please enter a valid email");
      AppSnackbar.error("Please enter a valid email");
      return;
    }

    authController.forgotPassword(
        email: email,
        
        );
  }
}
