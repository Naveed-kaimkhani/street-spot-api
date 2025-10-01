import 'dart:developer';

import 'package:StreetSpot/model/customer_dashboard_model.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/truck_model.dart';
import 'package:StreetSpot/model/truck_profile_response.dart';
import 'package:StreetSpot/repositries/dashboard_repository.dart';
import 'package:StreetSpot/utils/app_snackbar.dart';
import 'package:StreetSpot/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final DashboardRepository dashboardRepo;

  DashboardController({required this.dashboardRepo});

  var isLoading = false.obs;
  var dashboardData = Rxn<DashboardModel>();
  var customerDashboardData = Rxn<CustomerDashboardModel>(); // ✅ new observable
  var truckData = Rxn<TruckProfileResponse>();

  // ✅ fetch dashboard
  void fetchDashboard() {
    log("Fetching dashboard data");
    isLoading.value = true;
    dashboardRepo.fetchDashboard(
      onSuccess: (data) {
        isLoading.value = false;
        dashboardData.value = data;
        log(dashboardData.value!.menuItems.length.toString());
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }

  // ✅ new method for Customer Dashboard
  void fetchCustomerDashboard() async{
    isLoading.value = true;
    dashboardRepo.fetchCustomerDashboard(
      onSuccess: (data) {
        isLoading.value = false;
        customerDashboardData.value = data;
      },
      onError: (message) {
        isLoading.value = false;
        // Get.snackbar("Error", message, colorText: Colors.black);
        AppSnackbar.error(message);
      },
    );
  }

  
  // Fetch truck information by ID
  void fetchTruckInformation(int truckId) async {
    isLoading.value = true;
    dashboardRepo.fetchTruckInformation(
      truckId: truckId,
      onSuccess: (data) {
        isLoading.value = false;
        truckData.value = data;
      },
      onError: (message) {
        isLoading.value = false;
        // Get.snackbar("Error", message, colorText: Colors.black);
        AppSnackbar.error(message);
      },
    );
  }


}
