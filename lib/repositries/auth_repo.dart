import 'dart:convert';
import 'dart:developer';
import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/model/user_model.dart';
import 'package:StreetSpot/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  final ApiClient apiClient;
  AuthRepository({required this.apiClient});


  final UserController userController = Get.find<UserController>();

  Future<void> registerUser({
    required UserModel user,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      
      final response =
          await apiClient.signup(url: ApiEndpoints.signup,  
          body: user.toJson(),
);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          final data = responseData['data'];
          final token = data['access_token']; // ✅ correct field
          final userData = data['user']; // ✅ cokkrect field
          final registeredUser = UserModel.fromJson(userData);

          await userController.saveUserSessionFromResponse(
              registeredUser, token);

          onSuccess();
        } else {
          log(response.body);
          onError(responseData['message'] ?? 'Registration failed');
        }
      } else {
        log(response.body);
        final error = jsonDecode(response.body);
        onError(error['message'] ?? 'Registration failed');
      }
    } catch (e) {
      log(e.toString());
      onError("An error occurred during registration: $e");
    }
  }

  // auth_repository.dart
  Future<void> loginUser({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.login(
        url: ApiEndpoints.login,
        body: {
          'email': email,
          'password': password,
        },
      ).timeout(const Duration(seconds: 15));
      // log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
     
        final responseData = jsonDecode(response.body);

        if (responseData['success'] == true) {
          final data = responseData['data'];
          final token = data['access_token'];
          log("token value$token");
          final userData = data['user'];

          final user = UserModel.fromJson(userData);

          await userController.saveUserSessionFromResponse(user, token);

          onSuccess();
        } else {
          onError(responseData['message'] ?? 'Login failed');
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? 'Login failed');
      }
    } catch (e) {
      log(e.toString());
      onError("An error occurred during login.");
    }
  }

  Future<void> forgotPassword({
    required String email,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.put(
        url: ApiEndpoints.forgotPassword,
        body: {
          "email": email,
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          onSuccess();
        } else {
          onError(data['message'] ?? "Failed to send OTP");
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? "Failed to send OTP");
      }
    } catch (e) {
      onError("Something went wrong. Please try again.");
    }
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.put(
        url: ApiEndpoints.resetPassword,
        body: {
          "email": email,
          "otp": otp,
          "password": newPassword,
        },
      ).timeout(const Duration(seconds: 15));
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);

        if (data['success'] == true) {
          onSuccess();
        } else {
          onError(data['message'] ?? "Password reset failed");
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? "Password reset failed");
      }
    } catch (e) {
      onError("Something went wrong. Please try again.");
    }
  }
}
