

// import 'dart:developer';

// class DashboardModel {
//   final int followersCount;
//   final String? todaySales;
//   final List<MenuItem> popularMenuItems;
//   final List<MenuItem> menuItems;

//   DashboardModel({
//     required this.followersCount,
//     required this.todaySales,
//     required this.popularMenuItems,
//     required this.menuItems,
//   });

//   factory DashboardModel.fromJson(Map<String, dynamic> json) {
//     // log(json['menu_items']);
//     return DashboardModel(
//       followersCount: json['followers_count'] ?? 0,
//   todaySales: json['today_sales'],
//       // popularMenuItems: (json['popular_menu_items'] as List<dynamic>?)
//       //         ?.map((e) => MenuItem.fromJson(e))
//       //         .toList() ??
//       //     [],
//           popularMenuItems:    [],
          
//   // menuItems: (json['menu_items'] != null && json['menu_items'] is List)
//   //   ? (json['menu_items'] as List)
//   //       .map((e) => MenuItem.fromJson(Map<String, dynamic>.from(e)))
//   //       .toList()
//   //   : [],
//     menuItems: (json['menu_items'] as List<dynamic>?) ?.map((e) => MenuItem.fromJson(e)) .toList() ?? [],
//     );
//   }
// }

// class MenuItem {
//   final int id;
//   final String name;
//   final String description;
//   final String unitPrice;

//   final String discountPercentage;
//   final int timeToMake;
//   final double averageRating;
//   final String imageUrl;

//   MenuItem({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.unitPrice,
//     required this.timeToMake,
//     required this.averageRating,
//     required this.discountPercentage,
//     required this.imageUrl,
//   });

//   factory MenuItem.fromJson(Map<String, dynamic> json) {
//     return MenuItem(
//       id: json['id'],
//       name: json['name'],
//       description: json['description'] ?? '',
//       // unitPrice: double.tryParse(json['unit_price']?.toString() ?? '0') ?? 0.0,
//             unitPrice: json['unit_price'],
//                    discountPercentage: json['discount_percentage'],
//       timeToMake: json['time_to_make'] ?? 0,
//       averageRating: 0.0, // hardcoded since not in response
//       imageUrl: json['image_url'] ?? '',
//     );
//   }
// }









//




// ==================== Model ====================
class DashboardModel {
  final TruckInformation? truckInformation;
  final int followersCount;
  final String todaySales;
  final List<GraphData> graphData;
  final List<MenuItem> popularMenuItems;
  final List<MenuItem> menuItems;

  DashboardModel({
    this.truckInformation,
    required this.followersCount,
    required this.todaySales,
    required this.graphData,
    required this.popularMenuItems,
    required this.menuItems,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      truckInformation: json['truck_information'] != null
          ? TruckInformation.fromJson(json['truck_information'])
          : null,
      followersCount: json['followers_count'] ?? 0,
      todaySales: json['today_sales']?.toString() ?? "0",
      graphData: (json['graph_data'] as List<dynamic>?)
              ?.map((e) => GraphData.fromJson(e))
              .toList() ??
          [],
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

// Truck Information Model
class TruckInformation {
  final int id;
  final String truckName;
  final String cuisineType;
  final String phoneNumber;
  final String email;
  final String? healthRating;
  final String? averageRating;
  final String? startTime;
  final String? endTime;
  final String? truckLogo;

  TruckInformation({
    required this.id,
    required this.truckName,
    required this.cuisineType,
    required this.phoneNumber,
    required this.email,
    this.healthRating,
    this.averageRating,
    this.startTime,
    this.endTime,
    this.truckLogo,
  });

  factory TruckInformation.fromJson(Map<String, dynamic> json) {
    return TruckInformation(
      id: json['id'] ?? 0,
      truckName: json['truck_name'] ?? "",
      cuisineType: json['cuisine_type'] ?? "",
      phoneNumber: json['phone_number'] ?? "",
      email: json['email'] ?? "",
      healthRating: json['health_rating'],
      averageRating: json['average_rating']?.toString(),
      startTime: json['start_time'],
      endTime: json['end_time'],
      truckLogo: json['truck_logo'],
    );
  }
}

// Graph Data
class GraphData {
  final String monthName;
  final int year;
  final String totalAmountPaid;

  GraphData({
    required this.monthName,
    required this.year,
    required this.totalAmountPaid,
  });

  factory GraphData.fromJson(Map<String, dynamic> json) {
    return GraphData(
      monthName: json['month_name'] ?? "",
      year: json['year'] ?? 0,
      totalAmountPaid: json['total_amount_paid']?.toString() ?? "0",
    );
  }
}

// Menu Item
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
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      unitPrice: json['unit_price']?.toString() ?? "0",
      discountPercentage: json['discount_percentage']?.toString() ?? "0",
      timeToMake: json['time_to_make'] ?? 0,
      averageRating: 0.0, // Not provided in API
      imageUrl: json['image_url'] ?? "",
    );
  }
}
