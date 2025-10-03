import 'dart:developer';

import 'package:StreetSpot/model/category_model.dart';
import 'package:StreetSpot/model/customer_dashboard_model.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/menu_item.dart';
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
  
RxList<CategoryModel> categories = <CategoryModel>[].obs;


RxList<MenuItem2> menuItems = <MenuItem2>[].obs;
  void fetchDashboard() {
    
    isLoading.value = true;
    dashboardRepo.fetchDashboard(
      onSuccess: (data) {
        isLoading.value = false;
        dashboardData.value = data;
        
      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.info("Info", message);
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

void fetchCategories(int truckId) {
  dashboardRepo.fetchCategories(
    truckId: truckId,
    onSuccess: (data) {
      categories.assignAll(data);
    },
    onError: (message) {
      AppSnackbar.error(message);
    },
  );
}
// Add this method (follows exact pattern)
void fetchMenuItems(int truckId, int categoryId) async {
  isLoading.value = true;
  dashboardRepo.fetchMenuItems(
    truckId: truckId,
    categoryId: categoryId,
    onSuccess: (data) {
      isLoading.value = false;
      menuItems.value = data;
    },
    onError: (message) {
      isLoading.value = false;
      AppSnackbar.error(message);
    },
  );
}

}
