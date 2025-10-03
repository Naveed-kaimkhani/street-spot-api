

import 'dart:convert';
import 'dart:developer';

import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/model/order_model.dart';
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


Future<void> fetchAllOrders({
  required Function(List<OrderModel> orders) onSuccess,
  required Function(String message) onError,
}) async {
  try {
    final response = await _apiClient.get(
      url: ApiEndpoints.orders, // define this in your ApiEndpoints
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      log("Fetch Orders Response:");
log(data.toString());
      if (data['success'] == true) {
        final List ordersJson = data['data']['orders'] ?? [];
        final orders = ordersJson.map((e) => OrderModel.fromJson(e)).toList();
      
        onSuccess(orders);
      } else {
        onError(data['message'] ?? "Failed to fetch orders");
      }
    } else {
      final error = jsonDecode(response.body);
      onError(error['message'] ?? "Failed to fetch orders");
    }
  } catch (e) {
    onError("Something went wrong: $e");
  }
}




Future<void> acceptOrder({
  required int orderId,
  required Function(Map<String, dynamic> data) onSuccess,
  required Function(String message) onError,
}) async {
  try {
    final response = await _apiClient.put(
      url: ApiEndpoints.acceptOrder(orderId),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        onSuccess(data);
      } else {
        onError(data['message'] ?? "Failed to accept order");
      }
    } else {
      final error = jsonDecode(response.body);
      onError(error['message'] ?? "Failed to accept order");
    }
  } catch (e) {
    onError("Something went wrong: $e");

  }
}

}
