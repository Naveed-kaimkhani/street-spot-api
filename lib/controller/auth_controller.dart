import 'dart:developer';

import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/model/user_model.dart';
import 'package:StreetSpot/repositries/auth_repo.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:StreetSpot/utils/app_snackbar.dart';
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
        // Get.snackbar("Success", "Registered successfully",
        //     colorText: Colors.black);
        AppSnackbar.success("Registered successfully");
    
      // ✅ Navigate based on user role
      if (user.role == 'TRUCK_OWNER') {
        Get.offAndToNamed(AppRouteName.sellerbottomnavbar);
      } else {
        Get.offAndToNamed(AppRouteName.bottomnavbar);
      }

      // 👉 If you *still* want to go to email verification first:
      // Get.offAllNamed(AppRouteName.emailverification);
    },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

void loginUser({
    required String email,
    required String password,
  }) {
    isLoading.value = true;
    authRepo.loginUser(
      email: email,
      password: password,
      onSuccess: (UserModel user) {
        isLoading.value = false;
        AppSnackbar.success("Login successful");
        // Navigate based on user role
        log(user.role);
        if (user.role == 'TRUCK_OWNER') {
          Get.toNamed(AppRouteName.sellerbottomnavbar);
        } else {
          Get.offAndToNamed(AppRouteName.bottomnavbar);
       }
      },
      onError: (message) {
        isLoading.value = false;
        // Get.snackbar("Error", message, colorText: Colors.black);
        AppSnackbar.error(message);
      },
    );
  }

  void forgotPassword({required String email}) {
    isLoading.value = true;
    authRepo.forgotPassword(
      email: email,
      onSuccess: () {
        isLoading.value = false;

        otp.value = "";
        // Get.snackbar("Success", "OTP sent to your email",
        //     colorText: Colors.black);
        AppSnackbar.success("OTP sent to your email");
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
        // Get.snackbar("Error", message, colorText: Colors.black);
        AppSnackbar.error(message);
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

      // Get.snackbar("Success", "Password reset successfully",
      //     colorText: Colors.black);
      AppSnackbar.success("Password reset successfully");

      // after reset, take user back to login screen
      Get.offAllNamed(AppRouteName.sellerlogin);
    },
    onError: (message) {
      isLoading.value = false;
      // Get.snackbar("Error", message, colorText: Colors.black);
      AppSnackbar.error(message);
    },
  );
}

}
