import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void success(String message) {
    Get.snackbar(
      "Success",
      message,
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void error(String message) {
    Get.snackbar(
      "Error",
      message,
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void info(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}