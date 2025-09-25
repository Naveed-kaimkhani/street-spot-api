class TruckInformation {
  final int id;
  final String truckName;
  final String cuisineType;
  final String phoneNumber;
  final String email;
  final String healthRating;
  final String averageRating;
  final String? startTime;
  final String? endTime;

  TruckInformation({
    required this.id,
    required this.truckName,
    required this.cuisineType,
    required this.phoneNumber,
    required this.email,
    required this.healthRating,
    required this.averageRating,
    this.startTime,
    this.endTime,
  });

  factory TruckInformation.fromJson(Map<String, dynamic> json) {
    return TruckInformation(
      id: json['id'],
      truckName: json['truck_name'] ?? '',
      cuisineType: json['cuisine_type'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      email: json['email'] ?? '',
      healthRating: json['health_rating'] ?? '',
      averageRating: json['average_rating'] ?? '0.0',
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
