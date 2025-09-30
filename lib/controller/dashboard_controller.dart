import 'dart:developer';

import 'package:StreetSpot/model/customer_dashboard_model.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/truck_model.dart';
import 'package:StreetSpot/model/truck_profile_response.dart';
import 'package:StreetSpot/repositries/dashboard_repository.dart';
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
    isLoading.value = true;
    dashboardRepo.fetchDashboard(
      onSuccess: (data) {
        isLoading.value = false;
        dashboardData.value = data;
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: Colors.black);
      },
    );
  }

  // ✅ new method for Customer Dashboard
  void fetchCustomerDashboard() async{

    // final position = await Utils.getTruckLocation();
    // log(position.latitude.toString());
    isLoading.value = true;
    dashboardRepo.fetchCustomerDashboard(
      onSuccess: (data) {
        isLoading.value = false;
        customerDashboardData.value = data;
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: Colors.black);
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
        Get.snackbar("Error", message, colorText: Colors.black);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    // fetchDashboard();
    fetchCustomerDashboard();
  }
}
