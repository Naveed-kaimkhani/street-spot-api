import 'dart:developer';

class WeeklySchedule {
  final String day;
  final String startTime;
  final String endTime;
  final double? latitude;
  final double? longitude;
  final String? address;

  WeeklySchedule({
    required this.day,
    required this.startTime,
    required this.endTime,
    this.latitude,
    this.longitude,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      "day": day,
      "startTime": startTime,
      "endTime": endTime,
       "latitude": latitude,
       "longitude": longitude,

    "address": address,
      // if (latitude != null) "latitude": 123.0,
      // if (longitude != null) "longitude": 123.0,
      // if (address != null) "address": address,
    };
  }
}

class TruckModel {
  final String truckName;
  final String cuisineType;
  final String phoneNumber;
  final String email;
  final String healthRating;
  final String startTime;
  final String endTime;
  final bool enableGpsTracking;
  final List<WeeklySchedule> weeklySchedule;

  TruckModel({
    required this.truckName,
    required this.cuisineType,
    required this.phoneNumber,
    required this.email,
    required this.healthRating,
    required this.startTime,
    required this.endTime,
    required this.enableGpsTracking,
    required this.weeklySchedule,
  });

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
