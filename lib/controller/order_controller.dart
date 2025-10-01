// import 'package:StreetSpot/repositries/order_repository.dart';
// import 'package:StreetSpot/utils/app_snackbar.dart';
// import 'package:get/get.dart';


// class OrderController extends GetxController {
//   final OrderRepository _repository = OrderRepository();

//   final RxBool isLoading = false.obs;
//   final RxMap<String, dynamic> lastOrderResponse = <String, dynamic>{}.obs;

//   Future<void> createOrder({
//     required int truckId,
//     required List<Map<String, dynamic>> orderItems,
//   }) async {
//     try {
//       isLoading.value = true;
//       final response = await _repository.createOrder(
//         truckId: truckId,
//         orderItems: orderItems,
//       );
//       lastOrderResponse.value = response;

//     } catch (e) {
//       AppSnackbar.error(  e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }


import 'package:StreetSpot/controller/order_success_celebration.dart';
import 'package:StreetSpot/controller/cart_controller.dart';
import 'package:StreetSpot/repositries/order_repository.dart';
import 'package:StreetSpot/utils/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderRepository _repository = OrderRepository();

  final RxBool isLoading = false.obs;
  final RxMap<String, dynamic> lastOrderResponse = <String, dynamic>{}.obs;

  final CartController cartController = Get.find<CartController>();
  void createOrder({
    required int truckId,
    required List<Map<String, dynamic>> orderItems,
  }) {
    isLoading.value = true;

    _repository.createOrder(
      truckId: truckId,
      orderItems: orderItems,
      onSuccess: (data) {
        isLoading.value = false;
        lastOrderResponse.value = data;
                cartController.clearCart();
      _showLottieSuccessCelebration(data);

      },
      onError: (message) {
        isLoading.value = false;
        AppSnackbar.error(message);
      },
    );
  }


void _showLottieSuccessCelebration(dynamic orderData) {
  Get.dialog(
    OrderSuccessCelebration(
      orderData: orderData,
      onDismiss: () {
        Get.back();
        // Optional: Show a subtle snackbar
        // AppSnackbar.success("🎉 Order confirmed! Tracking started.");
      },
    ),
    barrierDismissible: false,
    barrierColor: Colors.black54,
  );
}
}
