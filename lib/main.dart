

import 'package:StreetSpot/services/dependencies.dart' as dep;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:StreetSpot/views/user/foodtrucking.dart';
import 'package:get/get.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
    // final componentcontroller = Get.put(UserController());
  await dep.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
]).then((_) {
    runApp(const StreetSpot());
  });
}


