import 'dart:convert';
import 'dart:developer';
import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/model/category_model.dart';
import 'package:StreetSpot/model/customer_dashboard_model.dart';
import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/menu_item.dart';
import 'package:StreetSpot/model/truck_profile_response.dart';
import 'package:StreetSpot/utils/utils.dart';
import 'package:get/get.dart';
import '../services/api_client.dart';

class DashboardRepository extends GetxController {
  final ApiClient apiClient;
  DashboardRepository({required this.apiClient});

  // fetch dashboard data
  // Future<void> fetchDashboard({
  //   required Function(DashboardModel data) onSuccess,
  //   required Function(String message) onError,
  // }) async {
  //   try {
  //     final response = await apiClient.get(
  //       url: ApiEndpoints.dashboard,
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final jsonData = jsonDecode(response.body);
  //       final data = jsonData['data'];
  //       log(data['truck_information']);
  //       if (data == null || data['truck_information'] == null) {
  //         onError("No truck found. Please register your truck first.");
  //         return;
  //       }
  //       final dashboard = DashboardModel.fromJson(jsonData['data']);

  //       onSuccess(dashboard);
  //     } else {
  //       final error = jsonDecode(response.body);
  //       onError(error['message'] ?? 'Failed to load dashboard');
  //     }
  //   } catch (e) {
  //     onError("Something went wrong. Please try again.$e");
  //   }
  // }


  // ==================== Repository ====================
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

      if (jsonData['success'] == true) {
        final data = jsonData['data'];

        // Handle case where truck_information is null
        if (data == null || data['truck_information'] == null) {
          onError("No truck found. Please register your truck first.");
          return;
        }

        final dashboard = DashboardModel.fromJson(data);
        onSuccess(dashboard);
      } else {
        onError(jsonData['message'] ?? "Something went wrong");
      }
    } else {
      final error = jsonDecode(response.body);
      onError(error['message'] ?? 'Failed to load dashboard');
    }
  } catch (e) {
    onError("Something went wrong. Please try again. $e");
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
        final customerDashboard = CustomerDashboardModel.fromJson(data);
        onSuccess(customerDashboard);
      } else {
        final error = jsonDecode(response.body);
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

  Future<void> fetchCategories({
    required int truckId,
    required Function(List<CategoryModel> data) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.get(
        url: ApiEndpoints.fetchCategoriesByTruckId(truckId),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);

        if (jsonData['success'] == true) {
          final List categoriesJson = jsonData['data']['categories'] ?? [];
          final categories =
              categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();

          onSuccess(categories);
        } else {
          onError(jsonData['message'] ?? 'Failed to load categories');
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? 'Failed to load categories');
      }
    } catch (e) {
      onError("Something went wrong. Please try again. $e");
    }
  }

// Add this method (exact same pattern as fetchCategories)
  Future<void> fetchMenuItems({
    required int truckId,
    required int categoryId,
    required Function(List<MenuItem2> data) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.get(
        url: ApiEndpoints.fetchMenuByCategoryId(truckId, categoryId),
      );
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['success'] == true) {
          final List menuJson = jsonData['data']['menu_items'] ?? [];
          final menus = menuJson.map((e) => MenuItem2.fromJson(e)).toList();

          onSuccess(menus);
        } else {
          onError(jsonData['message'] ?? 'Failed to load categories');
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? 'Failed to load menu items');
      }
    } catch (e) {
      onError("Something went wrong. Please try again. $e");
    }
  }
}
