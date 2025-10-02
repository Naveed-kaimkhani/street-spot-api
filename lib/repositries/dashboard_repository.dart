import 'dart:convert';
import 'dart:developer';
import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/model/customer_dashboard_model.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/truck_profile_response.dart';
import 'package:StreetSpot/utils/utils.dart';
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
        final data = jsonData['data'];
        if (data == null || data['truck_information'] == null) {
          onError("No truck found. Please register your truck first.");
          return;
        }

        final dashboard = DashboardModel.fromJson(jsonData['data']);

        onSuccess(dashboard);
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? 'Failed to load dashboard');
      }
    } catch (e) {
      onError("Something went wrong. Please try again.$e");
    }
  }

  Future<void> fetchCustomerDashboard({
    required Function(CustomerDashboardModel data) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final position = await Utils.getTruckLocation();

      final response = await apiClient.get(
        url:
            "${ApiEndpoints.truckInformationDashboard}{\"range\":10,\"latitude\":24.8607,\"longitude\":67.0019}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        log(data.toString());
        final customerDashboard = CustomerDashboardModel.fromJson(data);
        onSuccess(customerDashboard);
      } else {
        final error = jsonDecode(response.body);
        log(error.toString());
        onError(error['message'] ?? "Failed to load customer dashboard");
      }
    } catch (e) {
      onError("Something went wrong. $e");
    }
  }

  // Fetch truck information by ID
  Future<void> fetchTruckInformation({
    required int truckId,
    required Function(TruckProfileResponse data) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.get(
        url: "${ApiEndpoints.truckInformationPage}/$truckId",
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final jsonData = jsonDecode(response.body);
        // TruckModel truck = TruckModel.fromJson(jsonData['data']['truck']);
        TruckProfileResponse truckResponse =
            TruckProfileResponse.fromJson(jsonData['data']);

        onSuccess(truckResponse);
      } else {
        final error = jsonDecode(response.body) as Map<String, dynamic>?;
        onError(error?['message']?.toString() ??
            'Failed to load truck information');
      }
    } catch (e) {
      onError("Something went wrong: $e");
    }
  }
}
