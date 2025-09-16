import 'package:StreetSpot/helpers/appbindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:StreetSpot/controller/globalcontroller.dart';
import 'package:StreetSpot/custom_widgets/dismiss_keyboard.dart';
import 'package:StreetSpot/routes/app_routes.dart' show AppRouters;
import 'package:StreetSpot/utils/app_constants.dart';
import 'package:StreetSpot/utils/app_fonts.dart';
import 'package:StreetSpot/utils/app_strings.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class StreetSpot extends StatefulWidget {
  const StreetSpot({super.key});

  @override
  State<StreetSpot> createState() => _StreetSpotState();
}

class _StreetSpotState extends State<StreetSpot> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<GlobalController>(
          init: GlobalController(),
          builder: (context) {
            return GetMaterialApp(
              navigatorKey: AppConstants.navigatorKey,
              navigatorObservers: [KeyboardDismissalNavigatorObserver()],
              title: AppStrings.appTitle,
              scrollBehavior: CustomScrollBehavior(),
              initialBinding: AppBindings(),
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: AppColors.kPrimaryColor,
                scaffoldBackgroundColor: AppColors.transparentColor,
                fontFamily: AppFonts.plusJakartaSansRegular,
              ),
              debugShowCheckedModeBanner: false,
              getPages: AppRouters.routes,
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: widget!,
                );
              },
            );
          },
        );
      },
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
