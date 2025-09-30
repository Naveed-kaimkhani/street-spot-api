import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/model/category_model.dart';
import 'package:StreetSpot/model/truck_model.dart';
import 'package:get/get.dart';
import '../services/api_client.dart';

class TruckRepository extends GetxController {
  final ApiClient apiClient;
  TruckRepository({required this.apiClient});

  Future<void> addTruckInformation({
    required TruckModel truck,
    required VoidCallback onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      final response = await apiClient.post(
        url: ApiEndpoints.truckInformation,
        body: jsonEncode(truck.toJson()),
      );
      log(response.body);
      // onSuccess();

      if (response.statusCode == 200 || response.statusCode == 201) {
        // log(response.statusCode.toString());
        final data = jsonDecode(response.body);
      
        if (data['success'] == true) {
        onSuccess();
        } else {
          onError(data['message'] ?? "Failed to add truck info");
        }
      } else {
        final error = jsonDecode(response.body);
        onError(error['message'] ?? "Failed to add truck info");
      }
    } catch (e) {
      log(e.toString());
      onError("Something went wrong: $e");
    }
  }

  Future<void> addMenuItem({
    required String truckId,
    required File file,
    required Map<String, dynamic> data,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    try {
      log("${ApiEndpoints.creatMenu}$truckId");
      final response = await apiClient.postImagesToServer(
        endPoint: "${ApiEndpoints.creatMenu}$truckId",
        data: {
          "data": jsonEncode(data),
        },
        files: {
          "file": file,
        },
      );

      log("Menu response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess();
      } else {
        onError("Failed: ${response.body}");
      }
    } catch (e) {
      log(e.toString());
      onError(e.toString());
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await apiClient.get(url: ApiEndpoints.categories);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final categoriesJson = data['data']['categories'] as List;
        return categoriesJson.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to fetch categories");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<TruckModel?> fetchTruckInformation() async {
 final response = await apiClient.get(url: ApiEndpoints.categories);


  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(response.body);
    if (jsonBody['success'] == true &&
        jsonBody['data']?['truck_information'] != null) {
      return TruckModel.fromJson(jsonBody['data']['truck_information']);
    }
  }
  return null;
}

}
