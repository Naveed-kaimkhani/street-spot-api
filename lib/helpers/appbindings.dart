import 'package:StreetSpot/controller/auth_controller.dart';

import 'package:StreetSpot/controller/homcontroller.dart';
import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/repositries/auth_repo.dart';
import 'package:StreetSpot/repositries/dashboard_repository.dart';
import 'package:StreetSpot/repositries/truck_repository.dart';
import 'package:StreetSpot/services/api_client.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // Register ApiClient first
    Get.lazyPut(() => ApiClient());

    // Register repositories
    Get.lazyPut(() => AuthRepository(apiClient: Get.find()));
    Get.lazyPut(() => TruckRepository(apiClient: Get.find()));
    Get.lazyPut(() => DashboardRepository(apiClient: Get.find()));

    // Register controllers
    Get.lazyPut(() => AuthController(authRepo: Get.find()));
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => TruckController(truckRepo: Get.find()));
    Get.lazyPut(() => DashboardController(dashboardRepo: Get.find()));
  }
}