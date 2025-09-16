// repositories/truck_repository.dart
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:StreetSpot/constants/api_endpoints.dart';
import 'package:StreetSpot/model/truck_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart' as http;
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
//       final response = await apiClient
//           .post(
//             url: ApiEndpoints.truckInformation,
//             // body: truck.toJson(),
//             body: {
//     "truck_name": "test233",
//     "cuisine_type": "test12",
//     "phone_number": "12345678",
//     "email": "ashar@gmail.com",
//     "health_rating": "A",
//     "start_time": "12:50:01",
//     "end_time": "12:55",
//     "enable_gps_tracking": true,
//     "weekly_schedule": [
//         {
//             //   id?: number; off record to update
//             "day": "SUNDAY", // DAYS
//             "startTime": "12:53", // HH:mm or HH:mm:ss
//             "endTime": "12:55", // HH:mm or HH:mm:ss
//             "latitude": 123.00, // optional
//             "longitude": 123.00, // optional
//             "address": "demo address 123" // optional
//         }
//     ]
// }
//           )
//           .timeout(const Duration(seconds: 15));
final response = await apiClient.post(
  url: ApiEndpoints.truckInformation,
  
  body: jsonEncode({
    "truck_name": "test233",
    "cuisine_type": "test12",
    "phone_number": "12345678",
    "email": "ashar@gmail.com",
    "health_rating": "A",
    "start_time": "12:50:01",
    "end_time": "12:55",
    "enable_gps_tracking": true,
    "weekly_schedule": [
      {
        "day": "SUNDAY",
        "startTime": "12:53",
        "endTime": "12:55",
        "latitude": 123.00,
        "longitude": 123.00,
        "address": "demo address 123"
      }
    ]
  }),
);


      log("Truck Info Response: ${response.body}");

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
