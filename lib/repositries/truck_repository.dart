
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:StreetSpot/constants/api_endpoints.dart';
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
      log("yhn tk arha hy flow");
final response = await apiClient.post(
  url: ApiEndpoints.truckInformation,
  body: jsonEncode(truck.toJson()),

);



      if (response.statusCode == 200 || response.statusCode == 201) {
        
        log(response.statusCode.toString());
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
}
