class TruckReviewChart {
  final int rating;
  final int ratingCount;

  TruckReviewChart({
    required this.rating,
    required this.ratingCount,
  });

  factory TruckReviewChart.fromJson(Map<String, dynamic> json) {
    return TruckReviewChart(
      rating: json['rating'],
      ratingCount: json['rating_count'],
    );
  }
}
