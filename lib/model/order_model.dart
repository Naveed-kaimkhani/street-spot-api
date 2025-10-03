import 'package:StreetSpot/model/truck_model.dart';
import 'package:StreetSpot/model/user_model.dart';

// class OrderModel {
//   final int id;
//   final String status;
//   final double originalAmount;
//   final double paidAmount;
//   final DateTime createdAt;
//   final TruckModel truck;
//   final UserModel user;

//   OrderModel({
//     required this.id,
//     required this.status,
//     required this.originalAmount,
//     required this.paidAmount,
//     required this.createdAt,
//     required this.truck,
//     required this.user,
//   });

//   factory OrderModel.fromJson(Map<String, dynamic> json) {
//     return OrderModel(
//       id: json['id'],
//       status: json['status'] ?? '',
//       originalAmount: double.tryParse(json['original_amount'].toString()) ?? 0.0,
//       paidAmount: double.tryParse(json['paid_amount'].toString()) ?? 0.0,
//       createdAt: DateTime.parse(json['created_at']),
//       truck: TruckModel.fromJson(json['truck_information']),
//       user: UserModel.fromJson(json['user']),
//     );
//   }
// }



class OrderModel {
  final int id;
  final String status;
  final double originalAmount;
  final double paidAmount;
  final DateTime createdAt;
  final TruckModel truck;
  final UserModel user;

  OrderModel({
    required this.id,
    required this.status,
    required this.originalAmount,
    required this.paidAmount,
    required this.createdAt,
    required this.truck,
    required this.user,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      status: json['status'] ?? '',
      originalAmount: double.tryParse(json['original_amount'].toString()) ?? 0.0,
      paidAmount: double.tryParse(json['paid_amount'].toString()) ?? 0.0,
      createdAt: DateTime.parse(json['created_at']),
      truck: TruckModel.fromJson(json['truck_information'] ?? {}),
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }
}
