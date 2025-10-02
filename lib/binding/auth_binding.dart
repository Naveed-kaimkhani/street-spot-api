import 'package:StreetSpot/controller/auth_controller.dart';
import 'package:StreetSpot/controller/user_controller.dart';
import 'package:get/get.dart';
class AuthBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => AuthController(authRepo: Get.find()));     
    Get.lazyPut(() => UserController());     
  }
}
