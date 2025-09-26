

import 'package:StreetSpot/controller/user_controller.dart';
import 'package:StreetSpot/services/dependencies.dart' as dep;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:StreetSpot/views/user/foodtrucking.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  

  // final UserController userController = Get.put(UserController());
  await dep.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
]).then((_) {
    runApp(const StreetSpot());
  });
}


