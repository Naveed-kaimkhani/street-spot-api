import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/repositries/dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class DashboardController extends GetxController {
  final DashboardRepository dashboardRepo;

  DashboardController({required this.dashboardRepo});

  var isLoading = false.obs;
  var dashboardData = Rxn<DashboardModel>();

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

  @override
  void onInit() {
    super.onInit();
    fetchDashboard();
  }
}