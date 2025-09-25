import 'dart:convert';
import 'dart:developer';

import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:get/get.dart';
import '../services/api_client.dart';

class DashboardRepository extends GetxController {
  final ApiClient apiClient;
  DashboardRepository({required this.apiClient});

  // fetch dashboard data
  Future<void> fetchDashboard({
    required Function(DashboardModel data) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.get(
        url: ApiEndpoints.dashboard,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        log("Dashboard API Response: $jsonData"); // Debug log
        final dashboard = DashboardModel.fromJson(jsonData);
        onSuccess(dashboard);
      } else {
        final error = jsonDecode(response.body);
        log("Error Dashboard: ${response.body}");
        onError(error['message'] ?? 'Failed to load dashboard');
      }
    } catch (e) {
      log("Exception in fetchDashboard: $e");
      onError("Something went wrong. Please try again.$e");
    }
  }
}
