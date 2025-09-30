
import 'package:StreetSpot/controller/truck_controller.dart';
import 'package:flutter/material.dart' show StatelessWidget, Key, BuildContext, Widget, InputDecoration, OutlineInputBorder, Text, DropdownMenuItem, DropdownButtonFormField;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WeekdayDropdown extends StatelessWidget {
  WeekdayDropdown({Key? key}) : super(key: key);

  final TruckController controller = Get.find<TruckController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        value: controller.selectedDay.value,
        decoration: const InputDecoration(
          labelText: "Select a Day",
          border: OutlineInputBorder(),
        ),
        items: controller.availableDays
            .map(
              (day) => DropdownMenuItem<String>(
                value: day,
                child: Text(day),
              ),
            )
            .toList(),
        onChanged: controller.selectDay,
        validator: (value) =>
            value == null ? "Please select a day" : null,
      );
    });
  }
}