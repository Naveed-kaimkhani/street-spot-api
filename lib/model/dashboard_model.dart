

import 'dart:developer';

class DashboardModel {
  final int followersCount;
  final String todaySales;
  final List<MenuItem> popularMenuItems;
  final List<MenuItem> menuItems;

  DashboardModel({
    required this.followersCount,
    required this.todaySales,
    required this.popularMenuItems,
    required this.menuItems,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    // log(json['menu_items']);
    return DashboardModel(
      followersCount: json['followers_count'] ?? 0,
  todaySales: json['today_sales'],
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
  final String unitPrice;

  final String discountPercentage;
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
    required this.discountPercentage,
    required this.imageUrl,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      // unitPrice: double.tryParse(json['unit_price']?.toString() ?? '0') ?? 0.0,
            unitPrice: json['unit_price'],
                   discountPercentage: json['discount_percentage'],
      timeToMake: json['time_to_make'] ?? 0,
      averageRating: 0.0, // hardcoded since not in response
      imageUrl: json['image_url'] ?? '',
    );
  }
}
