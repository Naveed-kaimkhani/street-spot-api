class MenuItem2 {
  final int id;
  final int truckId;
  final int categoryId;
  final String name;
  final String description;
  final double unitPrice;
  final double discountPercentage;
  final int timeToMake;
  final String imageUrl;
  final int? createdBy;

  final int? quantity;

  MenuItem2({
    required this.id,
    required this.truckId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.unitPrice,
    required this.discountPercentage,
    required this.timeToMake,
    required this.imageUrl,
    this.createdBy,
    this.quantity,
  });

  factory MenuItem2.fromJson(Map<String, dynamic> json) {
    return MenuItem2(
      id: json['id'],
      truckId: json['truck_id'],
      categoryId: json['category_id'],
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      unitPrice: double.tryParse(json['unit_price'].toString()) ?? 0.0,
      discountPercentage:
          double.tryParse(json['discount_percentage'].toString()) ?? 0.0,
      timeToMake: json['time_to_make'] ?? 0,
      imageUrl: json['image_url'] ?? '',
      createdBy: json['created_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "truck_id": truckId,
      "category_id": categoryId,
      "name": name,
      "description": description,
      "unit_price": unitPrice,
      "discount_percentage": discountPercentage,
      "time_to_make": timeToMake,
      "image_url": imageUrl,
      "created_by": createdBy,
    };
  }




  MenuItem2 copyWith({
    int? id,
    int? truckId,
    int? categoryId,
    String? name,
    String? description,
    double? unitPrice,
    double? discountPercentage,
    int? timeToMake,
    String? imageUrl,
    int? createdBy,
    int? quantity,
  }) {
    return MenuItem2(
      id: id ?? this.id,
      truckId: truckId ?? this.truckId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      unitPrice: unitPrice ?? this.unitPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      timeToMake: timeToMake ?? this.timeToMake,
      imageUrl: imageUrl ?? this.imageUrl,
      createdBy: createdBy ?? this.createdBy,
      quantity: quantity ?? this.quantity,
    );
  }
}
