
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
      "latitude": 123.0,
      "longitude": 123.0,
      "address": address,
    };
  }

  factory WeeklySchedule.fromJson(Map<String, dynamic> json) {
    return WeeklySchedule(
      day: json['day'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      latitude: (json['coordinates']?['coordinates']?[1])?.toDouble(),
      longitude: (json['coordinates']?['coordinates']?[0])?.toDouble(),
      address: json['address'],
    );
  }
}
