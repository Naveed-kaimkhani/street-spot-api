import 'dart:async';
import 'dart:developer';
import 'package:StreetSpot/model/trunk_information.dart';
import 'package:StreetSpot/model/user_model.dart';
import 'package:StreetSpot/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  late SharedPreferences prefs;
  var token = ''.obs;

  Rxn<UserModel> user = Rxn<UserModel>();
TruckInformation? get truck => user.value?.truckInformation;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    getUserFromPrefs(); // Load session on init
  }

  Future<void> saveUserSessionFromResponse(
    UserModel userModel, String userToken) async {
  // Basic user info
  await prefs.setInt('id', userModel.id??0);
  await prefs.setString('first_name', userModel.name);
  await prefs.setString('email', userModel.email);
  await prefs.setString('role', userModel.role);
  await prefs.setString('avatar_url', userModel.profilePicture ?? "");
  await prefs.setString('otp', userModel.otp ?? "");
  await prefs.setString('token', userToken);

  // Truck information (nested object)
  if (userModel.truckInformation != null) {
    final truck = userModel.truckInformation!;
    await prefs.setInt('truck_id', truck.id);
    await prefs.setString('truck_name', truck.truckName);
    await prefs.setString('cuisine_type', truck.cuisineType);
    await prefs.setString('truck_email', truck.email);
    await prefs.setString('truck_phone', truck.phoneNumber);
    await prefs.setString('health_rating', truck.healthRating);
    await prefs.setString('average_rating', truck.averageRating);
    await prefs.setString('start_time', truck.startTime ?? "");
    await prefs.setString('end_time', truck.endTime ?? "");
  }

  token.value = userToken;
  user.value = userModel;
  log("User session saved: ${user.toJson()}");
}


  Future<void> getUserFromPrefs() async {
  final id = prefs.getInt('id');
  final name = prefs.getString('first_name');
  final email = prefs.getString('email');
  final role = prefs.getString('role');
  final profilePicture = prefs.getString('avatar_url');
  final otp = prefs.getString('otp');
  final tokenFromPrefs = prefs.getString('token');

  token.value = tokenFromPrefs ?? '';

  if (id == null || name == null || email == null || role == null) {
    user.value = null; // Set user to null if any data is missing
    return;
  }

  // Try loading truck info
  final truckId = prefs.getInt('truck_id');
  TruckInformation? truckInfo;
  if (truckId != null) {
    truckInfo = TruckInformation(
      id: truckId,
      truckName: prefs.getString('truck_name') ?? '',
      cuisineType: prefs.getString('cuisine_type') ?? '',
      phoneNumber: prefs.getString('truck_phone') ?? '',
      email: prefs.getString('truck_email') ?? '',
      healthRating: prefs.getString('health_rating') ?? '',
      averageRating: prefs.getString('average_rating') ?? '0.0',
      startTime: prefs.getString('start_time'),
      endTime: prefs.getString('end_time'),
    );
  }

  // Rebuild UserModel
  final userModel = UserModel(
    id: id,
    name: name,
    email: email,
    role: role,
    profilePicture: profilePicture,
    otp: otp,
    truckInformation: truckInfo,
  );

  user.value = userModel;
}


  // You can use the user's info throughout the app as follows:
  UserModel? get currentUser => user.value;

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    token.value = '';
    // user.value = null;
    Get.offAndToNamed(AppRouteName.sellerlogin);
  }
}
