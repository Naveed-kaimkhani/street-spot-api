import 'package:StreetSpot/controller/DashboardController.dart';
import 'package:StreetSpot/controller/auth_controller.dart';
import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/repositries/truck_repository.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => AuthController(authRepo: Get.find()));
    Get.lazyPut(() => UserController());
  Get.lazyPut(() => TruckController(truckRepo: Get.find()));
    Get.lazyPut(() => DashboardController(dashboardRepo: Get.find())); 

  }
}
