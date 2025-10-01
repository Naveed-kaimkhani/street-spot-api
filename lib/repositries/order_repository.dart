

import 'dart:convert';
import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/services/api_client.dart';
import 'package:get/get.dart';

class OrderRepository {
  final ApiClient _apiClient = Get.find<ApiClient>();

  Future<void> createOrder({
    required int truckId,
    required List<Map<String, dynamic>> orderItems,
    required Function(Map<String, dynamic> data) onSuccess,
    required Function(String message) onError,
  }) async {
    

    final body = jsonEncode({
      "truck_id": truckId,
      "order_items": orderItems,
    });

    try {
      final response = await _apiClient.post(
        url: ApiEndpoints.createOrder,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        onSuccess(data);
      } else {
        onError("Failed to create order: ${response.body}");
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
