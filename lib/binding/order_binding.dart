import 'package:StreetSpot/controller/cart_controller.dart';
import 'package:StreetSpot/controller/order_controller.dart';
import 'package:get/get.dart';
class OrderBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => OrderController());     
    Get.lazyPut(() => CartController());     
  }
}
