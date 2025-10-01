// // controllers/cart_controller.dart
// import 'package:StreetSpot/model/menu_item.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   final RxList<MenuItem2> _cartItems = <MenuItem2>[].obs;
//   final RxDouble _totalAmount = 0.0.obs;
//   final RxInt _totalItems = 0.obs;

//   // Getters
//   List<MenuItem2> get cartItems => _cartItems;
//   double get totalAmount => _totalAmount.value;
//   int get totalItems => _totalItems.value;
//   bool get isCartEmpty => _cartItems.isEmpty;

//   // Add item to cart
// void addToCart(MenuItem2 menuItem) {
//   final existingItemIndex = _cartItems.indexWhere(
//     (item) => item.id == menuItem.id,
//   );

//   if (existingItemIndex != -1) {
//     // Item already exists → show message instead of adding
//     Get.snackbar(
//       'Notice',
//       'Item is already in your cart',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.orange,
//       colorText: Colors.white,
//       duration: const Duration(seconds: 2),
//     );
//   } else {
//     // Add new item with quantity 1
//     final newItem = menuItem.copyWith(quantity: 1);
//     _cartItems.add(newItem);

//     _calculateTotals();
//     _showAddToCartSuccess();
//   }
// }


//   // Add item to cart with all required parameters
//   void addToCartWithDetails({
//     required int id,
//     required int truckId,
//     required int categoryId,
//     required String name,
//     required String description,
//     required double unitPrice,
//     required double discountPercentage,
//     required int timeToMake,
//     required String imageUrl,
//     int? createdBy,
//   }) {
//     final menuItem = MenuItem2(
//       id: id,
//       truckId: truckId,
//       categoryId: categoryId,
//       name: name,
//       description: description,
//       unitPrice: unitPrice,
//       discountPercentage: discountPercentage,
//       timeToMake: timeToMake,
//       imageUrl: imageUrl,
//       createdBy: createdBy,
//       quantity: 1,
//     );
    
//     addToCart(menuItem);
//   }

//   // Remove item from cart
//   void removeFromCart(int itemId) {
//     _cartItems.removeWhere((item) => item.id == itemId);
//     _calculateTotals();
//   }

//   // Increase item quantity
//   void increaseQuantity(int itemId) {
//     final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
//     if (itemIndex != -1) {
//       final item = _cartItems[itemIndex];
//       _cartItems[itemIndex] = item.copyWith(
//         quantity: (item.quantity ?? 0) + 1,
//       );
//       _calculateTotals();
//     }
//   }

//   // Decrease item quantity
//   void decreaseQuantity(int itemId) {
//     final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
//     if (itemIndex != -1) {
//       final item = _cartItems[itemIndex];
//       final currentQuantity = item.quantity ?? 0;
//       if (currentQuantity > 1) {
//         _cartItems[itemIndex] = item.copyWith(quantity: currentQuantity - 1);
//       } else {
//         removeFromCart(itemId);
//       }
//       _calculateTotals();
//     }
//   }

//   // Update item quantity
//   void updateQuantity(int itemId, int newQuantity) {
//     if (newQuantity <= 0) {
//       removeFromCart(itemId);
//       return;
//     }

//     final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
//     if (itemIndex != -1) {
//       final item = _cartItems[itemIndex];
//       _cartItems[itemIndex] = item.copyWith(quantity: newQuantity);
//       _calculateTotals();
//     }
//   }

//   // Clear entire cart
//   void clearCart() {
//     _cartItems.clear();
//     _calculateTotals();
//   }

//   // Check if item is in cart
//   bool isItemInCart(int menuItemId) {
//     return _cartItems.any((item) => item.id == menuItemId);
//   }

//   // Get item quantity in cart
//   int getItemQuantity(int menuItemId) {
//     final item = _cartItems.firstWhere(
//       (item) => item.id == menuItemId,
//       orElse: () => MenuItem2(
//         id: -1,
//         truckId: -1,
//         categoryId: -1,
//         name: '',
//         description: '',
//         unitPrice: 0.0,
//         discountPercentage: 0.0,
//         timeToMake: 0,
//         imageUrl: '',
//         quantity: 0,
//       ),
//     );
//     return item.quantity ?? 0;
//   }

//   // Calculate totals
//   void _calculateTotals() {
//     double total = 0.0;
//     int itemsCount = 0;

//     for (final item in _cartItems) {
//       final quantity = item.quantity ?? 0;
//       final priceAfterDiscount = item.unitPrice * (1 - (item.discountPercentage / 100));
//       total += priceAfterDiscount * quantity;
//       itemsCount += quantity;
//     }

//     _totalAmount.value = total;
//     _totalItems.value = itemsCount;
//   }

//   // Show success message
//   void _showAddToCartSuccess() {
//     Get.snackbar(
//       'Success!',
//       'Item added to cart',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//       duration: const Duration(seconds: 2),
//     );
//   }

//   // Apply additional discount
//   void applyDiscount(double discountPercentage) {
//     if (discountPercentage < 0 || discountPercentage > 100) return;
    
//     final currentTotal = _totalAmount.value;
//     final discountAmount = (currentTotal * discountPercentage) / 100;
//     _totalAmount.value = currentTotal - discountAmount;
//   }

//   // Get cart summary
//   Map<String, dynamic> getCartSummary() {
//     return {
//       'totalItems': _totalItems.value,
//       'totalAmount': _totalAmount.value,
//       'items': _cartItems.map((item) => item.toJson()).toList(),
//     };
//   }

//   // Get item count for badge
//   int get cartItemCount {
//     return _cartItems.fold(0, (sum, item) => sum + (item.quantity ?? 0));
//   }
// }


// controllers/cart_controller.dart
import 'dart:convert';
import 'package:StreetSpot/model/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  final RxList<MenuItem2> _cartItems = <MenuItem2>[].obs;
  final RxDouble _totalAmount = 0.0.obs;
  final RxInt _totalItems = 0.obs;

  static const String cartStorageKey = "cart_items";

  // Getters
  List<MenuItem2> get cartItems => _cartItems;
  double get totalAmount => _totalAmount.value;
  int get totalItems => _totalItems.value;
  bool get isCartEmpty => _cartItems.isEmpty;

  @override
  void onInit() {
    super.onInit();
    _loadCartFromStorage();
  }

  // Save cart into SharedPreferences
  Future<void> _saveCartToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = jsonEncode(_cartItems.map((e) => e.toJson()).toList());
    await prefs.setString(cartStorageKey, itemsJson);
  }

  // Load cart from SharedPreferences
  Future<void> _loadCartFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson = prefs.getString(cartStorageKey);
    if (itemsJson != null && itemsJson.isNotEmpty) {
      final decoded = jsonDecode(itemsJson) as List;
      _cartItems.assignAll(decoded.map((e) => MenuItem2.fromJson(e)).toList());
      _calculateTotals();
    }
  }

  // Add item to cart
  void addToCart(MenuItem2 menuItem) {
    final existingItemIndex = _cartItems.indexWhere(
      (item) => item.id == menuItem.id,
    );

    if (existingItemIndex != -1) {
      // Item already exists → show message instead of adding
      Get.snackbar(
        'Notice',
        'Item is already in your cart',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } else {
      // Add new item with quantity 1
      final newItem = menuItem.copyWith(quantity: 1);
      _cartItems.add(newItem);

      _calculateTotals();
      _showAddToCartSuccess();
      _saveCartToStorage();
    }
  }

  // Add item to cart with all required parameters
  void addToCartWithDetails({
    required int id,
    required int truckId,
    required int categoryId,
    required String name,
    required String description,
    required double unitPrice,
    required double discountPercentage,
    required int timeToMake,
    required String imageUrl,
    int? createdBy,
  }) {
    final menuItem = MenuItem2(
      id: id,
      truckId: truckId,
      categoryId: categoryId,
      name: name,
      description: description,
      unitPrice: unitPrice,
      discountPercentage: discountPercentage,
      timeToMake: timeToMake,
      imageUrl: imageUrl,
      createdBy: createdBy,
      quantity: 1,
    );
    
    addToCart(menuItem);
  }

  // Remove item from cart
  void removeFromCart(int itemId) {
    _cartItems.removeWhere((item) => item.id == itemId);
    _calculateTotals();
    _saveCartToStorage();
  }

  // Increase item quantity
  void increaseQuantity(int itemId) {
    final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      final item = _cartItems[itemIndex];
      _cartItems[itemIndex] = item.copyWith(
        quantity: (item.quantity ?? 0) + 1,
      );
      _calculateTotals();
      _saveCartToStorage();
    }
  }

  // Decrease item quantity
  void decreaseQuantity(int itemId) {
    final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      final item = _cartItems[itemIndex];
      final currentQuantity = item.quantity ?? 0;
      if (currentQuantity > 1) {
        _cartItems[itemIndex] = item.copyWith(quantity: currentQuantity - 1);
      } else {
        removeFromCart(itemId);
      }
      _calculateTotals();
      _saveCartToStorage();
    }
  }

  // Update item quantity
  void updateQuantity(int itemId, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(itemId);
      return;
    }

    final itemIndex = _cartItems.indexWhere((item) => item.id == itemId);
    if (itemIndex != -1) {
      final item = _cartItems[itemIndex];
      _cartItems[itemIndex] = item.copyWith(quantity: newQuantity);
      _calculateTotals();
      _saveCartToStorage();
    }
  }

  // Clear entire cart
  void clearCart() async {
    _cartItems.clear();
    _calculateTotals();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartStorageKey);
  }

  // Check if item is in cart
  bool isItemInCart(int menuItemId) {
    return _cartItems.any((item) => item.id == menuItemId);
  }

  // Get item quantity in cart
  int getItemQuantity(int menuItemId) {
    final item = _cartItems.firstWhere(
      (item) => item.id == menuItemId,
      orElse: () => MenuItem2(
        id: -1,
        truckId: -1,
        categoryId: -1,
        name: '',
        description: '',
        unitPrice: 0.0,
        discountPercentage: 0.0,
        timeToMake: 0,
        imageUrl: '',
        quantity: 0,
      ),
    );
    return item.quantity ?? 0;
  }

  // Calculate totals
  void _calculateTotals() {
    double total = 0.0;
    int itemsCount = 0;

    for (final item in _cartItems) {
      final quantity = item.quantity ?? 0;
      final priceAfterDiscount = item.unitPrice * (1 - (item.discountPercentage / 100));
      total += priceAfterDiscount * quantity;
      itemsCount += quantity;
    }

    _totalAmount.value = total;
    _totalItems.value = itemsCount;
  }

  // Show success message
  void _showAddToCartSuccess() {
    Get.snackbar(
      'Success!',
      'Item added to cart',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
  }

  // Apply additional discount
  void applyDiscount(double discountPercentage) {
    if (discountPercentage < 0 || discountPercentage > 100) return;
    
    final currentTotal = _totalAmount.value;
    final discountAmount = (currentTotal * discountPercentage) / 100;
    _totalAmount.value = currentTotal - discountAmount;
  }

  // Get cart summary
  Map<String, dynamic> getCartSummary() {
    return {
      'totalItems': _totalItems.value,
      'totalAmount': _totalAmount.value,
      'items': _cartItems.map((item) => item.toJson()).toList(),
    };
  }

  // Get item count for badge
  int get cartItemCount {
    return _cartItems.fold(0, (sum, item) => sum + (item.quantity ?? 0));
  }
}
