import 'package:StreetSpot/model/truck_model.dart';

class CustomerDashboardModel {
  final List<TruckModel> mapTrucks;
  final List<dynamic> recommendedTrucks;

  CustomerDashboardModel({
    required this.mapTrucks,
    required this.recommendedTrucks,
  });


    factory CustomerDashboardModel.fromJson(Map<String, dynamic> json) {
    final mapTrucksJson = json['data']['map_trucks'] as List? ?? [];
    final recommendedTrucksJson = json['data']['recommended_trucks'] as List? ?? [];

    return CustomerDashboardModel(
      mapTrucks: mapTrucksJson.map((t) => TruckModel.fromJson(t)).toList(),
      recommendedTrucks: recommendedTrucksJson.map((t) => TruckModel.fromJson(t)).toList(),
    );
  }
}
