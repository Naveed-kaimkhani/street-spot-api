import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:StreetSpot/controller/homcontroller.dart';
import 'package:StreetSpot/model/category_model.dart';
import 'package:StreetSpot/model/truck_model.dart';
import 'package:StreetSpot/repositries/truck_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TruckController extends GetxController {
  final TruckRepository truckRepo;
  TruckController({required this.truckRepo});
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  final dashboardController = Get.find<DashboardController>();
  RxBool isLoading = false.obs;

  var selectedCuisine = "".obs; // initialized as empty string
  RxList<WeeklySchedule> weeklySchedules = <WeeklySchedule>[].obs;
  Rx<CategoryModel?> selectedCategory = Rx<CategoryModel?>(null);

  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  final weeklyStartTime = TextEditingController();
  final weeklyEndTime = TextEditingController();

  final mondayLocationController = TextEditingController();

  final truckName = TextEditingController();

  final foodName = TextEditingController();

  final foodPrice = TextEditingController();

  final foodDelievery = TextEditingController();

  final foodDescription = TextEditingController();

  final discountPercentage = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  var selectedRating = "A".obs; // default value
  var enableManualLocation = false.obs;
  var availableDays = <String>[
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY",
  ].obs;
  // ===== Actions =====
  void setCuisine(String cuisine) {
    selectedCuisine.value = cuisine;
  }

  void setRating(String rating) {
    selectedRating.value = rating;
  }

  void toggleManualLocation(bool value) {
    enableManualLocation.value = value;
  }

  final RxnString selectedDay = RxnString();

  void selectDay(String? day) {
    if (day != null && availableDays.contains(day)) {
      selectedDay.value = day;

      // // reset value so Dropdown doesn't try to hold a removed item
      // selectedDay.value = null;
    }
  }
  

  void clearDay() => selectedDay.value = '';
  // Add a new schedule

  void removeSchedule(int index) {
    if (index >= 0 && index < weeklySchedules.length) {
      weeklySchedules.removeAt(index);
    }
  }

  void addSchedule() {
    if (selectedDay.value == null ||
        weeklyStartTime.text.isEmpty ||
        weeklyEndTime.text.isEmpty) {
      Get.snackbar("Error", "Please fill day, start & end time");
      return;
    }

    weeklySchedules.add(WeeklySchedule(
      day: selectedDay.value!,
      startTime: weeklyStartTime.text,
      endTime: weeklyEndTime.text,
      address: mondayLocationController.text.isNotEmpty
          ? mondayLocationController.text
          : null,
    ));
    log(weeklySchedules.length.toString());
    // clear inputs

      availableDays.remove(selectedDay.value);
    selectedDay.value = null;

    mondayLocationController.clear();
    weeklyStartTime.clear();
    weeklyEndTime.clear();
  }

  void addTruckInfo({required TruckModel truck}) {
    isLoading.value = true;
//nkj@gmail.com
    truckRepo.addTruckInformation(
      truck: truck,
      onSuccess: () {
        isLoading.value = false;
        Get.snackbar("Success", "Truck information added",
            colorText: Colors.black);
        Get.back();
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: Colors.black);
      },
    );
  }

  @override
  void onClose() {
    // Dispose controllers when screen is closed
    startTimeController.dispose();
    endTimeController.dispose();
    mondayLocationController.dispose();
    super.onClose();
  }

  void submitTruckInfo() {
    final truck = TruckModel(
      truckName: truckName.text.trim(),
      cuisineType: selectedCuisine.value ?? "",
      phoneNumber: phoneController.text.trim(),
      email: emailController.text.trim(),
      healthRating: selectedRating.value,
      startTime: startTimeController.text.trim(),
      endTime: endTimeController.text.trim(),
      enableGpsTracking: enableManualLocation.value,
      weeklySchedule: weeklySchedules, // build list from your UI
    );
    
    isLoading.value = true;
    truckRepo.addTruckInformation(
      truck: truck,
      onSuccess: () {
        isLoading.value = false;
        Get.back();
        Get.snackbar("Success", "Truck info saved successfully",
            colorText: Colors.black);
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: const Color.fromARGB(255, 3, 1, 1));
      },
    );
  }

  // Add menu item
  void addMenuItem({
    required String truckId,
    required File file,
  }) {
    if (foodName.text.isEmpty ||
        foodPrice.text.isEmpty ||
        foodDelievery.text.isEmpty ||
        foodDescription.text.isEmpty) {
      Get.snackbar("Error", "All fields are required", colorText: Colors.black);
      return;
    }

    isLoading.value = true;

    truckRepo.addMenuItem(
      truckId: truckId,
      file: file,
      data: {
        "name": foodName.text.trim(),
        "unit_price": double.tryParse(foodPrice.text.trim()) ?? 0, // number
        "time_to_make": int.tryParse(foodDelievery.text.trim()) ?? 0, // integer
        "description": foodDescription.text.trim(),
        "category_id": selectedCategory.value!.id, // ✅ dynamic category id
        "discount_percentage":
            double.tryParse(discountPercentage.text.trim()) ?? 0,
      },
      onSuccess: () {
        isLoading.value = false;
        Get.back();
        Get.snackbar("Success", "Menu item added successfully",
            colorText: Colors.black);

        dashboardController.fetchDashboard();
      },
      onError: (message) {
        isLoading.value = false;
        Get.snackbar("Error", message, colorText: Colors.black);
      },
    );
  }

  Future<void> loadCategories() async {
    if (categories.isNotEmpty) return; // ✅ use cached data

    try {
      isLoading.value = true;
      final result = await truckRepo.fetchCategories();
      categories.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.black);
    } finally {
      isLoading.value = false;
    }
  }
}
