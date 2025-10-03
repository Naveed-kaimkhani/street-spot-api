import 'dart:developer';

import 'package:StreetSpot/model/dashboard_model.dart';
import 'package:StreetSpot/model/menu_item.dart';
import 'package:StreetSpot/model/weekly_schedule.dart';

// class TruckModel {
//   final int? id;
//   final String truckName;
//   final String cuisineType;
//   final String phoneNumber;
//   final String email;
//   final String healthRating;
//   final String startTime;
//   final String endTime;
//   final bool enableGpsTracking;

//   final double? latitude;
//   final double? longitude;
//   final double? distance;
//   final double? averageRating;
//   final List<WeeklySchedule> weeklySchedule;

//   final List<MenuItem2>? menuItems; // 👈 added here

//   TruckModel({
//     required this.truckName,
//     required this.cuisineType,
//     required this.phoneNumber,
//     required this.email,
//     required this.healthRating,
//     required this.startTime,
//     required this.endTime,
//     required this.enableGpsTracking,
//     required this.weeklySchedule,
//     this.menuItems,
//     this.id,
//     this.latitude,
//     this.longitude,
//     this.distance,
//     this.averageRating,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       "truck_name": truckName,
//       "cuisine_type": cuisineType,
//       "phone_number": phoneNumber,
//       "email": email,
//       "health_rating": healthRating,
//       "start_time": startTime,
//       "end_time": endTime,
//       "enable_gps_tracking": false,
//       "weekly_schedule": weeklySchedule.map((e) => e.toJson()).toList(),
//     };
//   }

//   factory TruckModel.fromJson(Map<String, dynamic> json) {
// final coords = (json['coordinates']?['coordinates'] as List?) ?? [0.0, 0.0];
//     return TruckModel(
//       truckName: json['truck_name'] ?? '',
//       cuisineType: json['cuisine_type'] ?? '',
//       phoneNumber: json['phone_number'] ?? '',
//       email: json['email'] ?? '',
//       healthRating: json['health_rating'] ?? '',
//       startTime: json['start_time'] ?? '',
//       endTime: json['end_time'] ?? '',
//       enableGpsTracking: json['enable_gps_tracking'] ?? false,
//       weeklySchedule: (json['weekly_schedule'] as List<dynamic>?)
//               ?.map((e) => WeeklySchedule.fromJson(e))
//               .toList() ??
//           [],
//       id: json['id'],
//       longitude: (coords[0] as num).toDouble(), // first = longitude
//       latitude: (coords[1] as num).toDouble(), // second = latitude

//       distance: json['distance'] != null
//           ? (json['distance'] as num).toDouble()
//           : null,

//       averageRating: double.tryParse(json['average_rating'].toString()) ?? 0.0,
//       menuItems: (json['menu_items'] as List<dynamic>?)
//               ?.map((e) => MenuItem2.fromJson(e))
//               .toList() ??
//           [],
//     );
//   }
// }



class TruckModel {
  final int? id;
  final String truckName;
  final String cuisineType;
  final String phoneNumber;
  final String email;
  final String healthRating;
  final String startTime;
  final String endTime;
  final bool enableGpsTracking;
  final double? latitude;
  final double? longitude;
  final double? distance;
  final double? averageRating;
  final List<WeeklySchedule> weeklySchedule;
  final List<MenuItem2>? menuItems;

  TruckModel({
    this.id,
    required this.truckName,
    required this.cuisineType,
    required this.phoneNumber,
    required this.email,
    required this.healthRating,
    required this.startTime,
    required this.endTime,
    required this.enableGpsTracking,
    required this.weeklySchedule,
    this.menuItems,
    this.latitude,
    this.longitude,
    this.distance,
    this.averageRating,
  });

  factory TruckModel.fromJson(Map<String, dynamic> json) {
    final coords = (json['coordinates']?['coordinates'] as List?) ?? [0.0, 0.0];

    return TruckModel(
      id: json['id'],
      truckName: json['truck_name'] ?? '',
      cuisineType: json['cuisine_type'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      email: json['email'] ?? '',
      healthRating: json['health_rating'] ?? '',
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      enableGpsTracking: json['enable_gps_tracking'] ?? false,
      weeklySchedule: (json['weekly_schedule'] as List<dynamic>?)
              ?.map((e) => WeeklySchedule.fromJson(e))
              .toList() ??
          [],
      longitude: (coords[0] as num).toDouble(),
      latitude: (coords[1] as num).toDouble(),
      distance: json['distance'] != null
          ? (json['distance'] as num).toDouble()
          : null,
      averageRating: json['average_rating'] != null
          ? double.tryParse(json['average_rating'].toString()) ?? 0.0
          : null,
      menuItems: (json['menu_items'] as List<dynamic>?)
              ?.map((e) => MenuItem2.fromJson(e))
              .toList() ??
          [],
    );
  }

    Map<String, dynamic> toJson() {
    return {
      "truck_name": truckName,
      "cuisine_type": cuisineType,
      "phone_number": phoneNumber,
      "email": email,
      "health_rating": healthRating,
      "start_time": startTime,
      "end_time": endTime,
      "enable_gps_tracking": false,
      "weekly_schedule": weeklySchedule.map((e) => e.toJson()).toList(),
    };
  }
}
