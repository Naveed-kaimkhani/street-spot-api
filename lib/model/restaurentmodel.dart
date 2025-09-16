// Restaurant data model
class Restaurant {
  final String name;
  final String imagePath;
  final String category;
  final double rating;
  final String time;
  final List<String> galleryImages;

  Restaurant({
    required this.name,
    required this.imagePath,
    required this.category,
    required this.rating,
    required this.time,
    required this.galleryImages,
  });
}
