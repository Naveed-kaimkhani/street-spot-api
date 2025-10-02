
import 'package:StreetSpot/model/truck_model.dart';
import 'package:StreetSpot/model/truck_review_chart.dart';

class TruckProfileResponse {
  final TruckModel truck;
  final List<TruckReviewChart> truckReviewChart;

  TruckProfileResponse({
    required this.truck,
    required this.truckReviewChart
  });

  factory TruckProfileResponse.fromJson(Map<String, dynamic> json) {
    return TruckProfileResponse(
      truck: TruckModel.fromJson(json['truck']),
      truckReviewChart: (json['truck_review_chart'] as List<dynamic>?)
              ?.map((e) => TruckReviewChart.fromJson(e))
              .toList() ??
          [],
    );
  }
}