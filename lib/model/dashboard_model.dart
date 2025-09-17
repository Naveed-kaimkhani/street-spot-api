class DashboardModel {
  final int followersCount;
  final int todaySales;
  final List<MenuItem> popularMenuItems;
  final List<MenuItem> menuItems;

  DashboardModel({
    required this.followersCount,
    required this.todaySales,
    required this.popularMenuItems,
    required this.menuItems,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      followersCount: json['followers_count'] ?? 0,
      todaySales: json['today_sales'] ?? 0,
      popularMenuItems: (json['popular_menu_items'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e))
              .toList() ??
          [],
      menuItems: (json['menu_items'] as List<dynamic>?)
              ?.map((e) => MenuItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class MenuItem {
  final int id;
  final String name;
  final String description;
  final double unitPrice;
  final int timeToMake;
  final double averageRating;
  final String imageUrl;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.unitPrice,
    required this.timeToMake,
    required this.averageRating,
    required this.imageUrl,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      unitPrice: (json['unit_price'] ?? 0).toDouble(),
      timeToMake: json['time_to_make'] ?? 0,
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      imageUrl: json['image_url'] ?? '',
    );
  }
}
