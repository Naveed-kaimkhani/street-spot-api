class CategoryModel {
  final int id;
  final String? categoryName;
  final String? categoryImage;

  CategoryModel({
    required this.id,
    this.categoryName,
    this.categoryImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      categoryName: json['category_name']?.toString(),
      categoryImage: json['category_image'],
    );
  }
}
