import 'dart:developer';

import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/model/user_model.dart';
import 'package:StreetSpot/repositries/auth_repo.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository authRepo;

  AuthController({required this.authRepo});

  final nameController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;
  final isPasswordHidden = true.obs;
  var selectedRole = "CUSTOMER".obs;

  var otp = "".obs;
  final UserController userController = Get.find<UserController>();

  // set user role
  void setRole(String role) {
    selectedRole.value = role;
  }

  // register User
  void registerUser({required UserModel user}) {
    isLoading.value = true;

    authRepo.registerUser(
      user: user,
      onSuccess: () {
        isLoading.value = false;
        Get.snackbar("Success", "Registered successfully",
            colorText: Colors.black);
        Get.offAllNamed(
            AppRouteName.emailverification); // Navigate or trigger OTP logic
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: Colors.black);
      },
    );
  }

// auth_controller.dart
  void loginUser({
    required String email,
    required String password,
  }) {
    isLoading.value = true;
    authRepo.loginUser(
      email: email,
      password: password,
      onSuccess: () {
        isLoading.value = false;

        Get.snackbar("Success", "Login successful", colorText: Colors.black);
        // Get.offAllNamed(RouteName
        //     .bottomNavigation); // Navigate to home or dashboard after login
        Get.offAllNamed(AppRouteName.emailverification);
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: Colors.black);
      },
    );
  }

  // ✅ forgot password
  void forgotPassword({required String email}) {
    isLoading.value = true;
    authRepo.forgotPassword(
      email: email,
      onSuccess: () {
        isLoading.value = false;

        otp.value = "";
        Get.snackbar("Success", "OTP sent to your email",
            colorText: Colors.black);
        log("coming from forget");
        Get.toNamed(
          AppRouteName.emailverification,
          arguments: {
            "isFromForgotPassword": true, // 👈 send your param
            "email": email,
          },
        );
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: Colors.black);
      },
    );
  }


  // ✅ reset password
void resetPassword({
  required String email,
  required String otp,
  required String newPassword,
}) {
  isLoading.value = true;

  authRepo.resetPassword(
    email: email,
    otp: otp,
    newPassword: newPassword,
    onSuccess: () {
      isLoading.value = false;

      Get.snackbar("Success", "Password reset successfully",
          colorText: Colors.black);

      // after reset, take user back to login screen
      Get.offAllNamed(AppRouteName.LOGIN_SCREEN_ROUTE);
    },
    onError: (message) {
      isLoading.value = false;
      Get.snackbar("Error", message, colorText: Colors.black);
    },
  );
}

}
