import 'package:StreetSpot/repositries/auth_repo.dart';
import 'package:StreetSpot/repositries/dashboard_repository.dart';
import 'package:StreetSpot/repositries/truck_repository.dart';
import 'package:StreetSpot/services/api_client.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient());
  Get.lazyPut(() => AuthRepository(apiClient: Get.find()), );
  Get.lazyPut(() => TruckRepository(apiClient: Get.find()));
  Get.lazyPut(() => DashboardRepository(apiClient: Get.find()));
  
}
