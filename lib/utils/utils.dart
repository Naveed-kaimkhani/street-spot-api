import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Utils {
 static Future<bool> checkInternetConnection() async {
  final connectivityResults = await Connectivity().checkConnectivity();

  if (connectivityResults.contains(ConnectivityResult.none)) {
    Get.snackbar(
      "No Internet",
      "Please check your connection and try again.",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return false;
  }

  return true;
}


}