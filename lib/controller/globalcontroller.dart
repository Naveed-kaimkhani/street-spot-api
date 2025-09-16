// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get i => Get.find();

  // Rxn<UserModel> currentUser = Rxn(null);

  // Future<void> initShared() async {
  //   await SharedPreference().sharedPreference;
  // }

  // void updateGetx({required UserModel? current}) {
  //   currentUser.value = current;
  //   log("current user: ${currentUser.value?.toJson()}");
  //   update();
  // }

  // Future<void> loadCurrentUserFromSharedPreference(
  //     {required BuildContext context}) async {
  //   try {
  //     final userJson = await SharedPreference().getUser();
  //     var userLocation = await SharedPreference().getUserLocation();

  //     if (userJson != null) {
  //       currentUser.value = userJson;

  //       if (currentUser.value != null) {
  //         if (userLocation != null) {
  //           AppNavigation.navigateToRemovingAll(
  //             context,
  //             AppRouteName.BOTTOM_BAR_SCREEN_ROUTE,
  //           );
  //           log("Current User: ${currentUser.value?.toJson()}");
  //         } else {
  //           AppNavigation.navigateReplacementNamed(
  //             context,
  //             AppRouteName.ENABLE_LOCATION_SCREEN_ROUTE,
  //           );
  //         }
  //       } else {
  //         AppNavigation.navigateToRemovingAll(
  //           context,
  //           AppRouteName.LOGIN_SCREEN_ROUTE,
  //         );
  //       }
  //     } else {
  //       AppNavigation.navigateToRemovingAll(
  //         context,
  //         AppRouteName.LOGIN_SCREEN_ROUTE,
  //       );
  //     }
  //   } catch (e) {
  //     AppNavigation.navigateToRemovingAll(
  //       context,
  //       AppRouteName.LOGIN_SCREEN_ROUTE,
  //     );
  //   }
  // }

  //! Notificaiton Stuff
  // final NotificationNavigationClass _notificationNavigationClass =
  //     NotificationNavigationClass();

  // void validateUser() async {
  //   // logData(message: "_validateUser");
  //   log("_validateUser");
  //   try {
  //     await SharedPreference().sharedPreference;
  //     await FirebaseMessagingService().initializeNotificationSettings();
  //     _setNotifications();
  //     print("haha");
  //   } catch (error) {
  //     print("Error: $error");
  //     _notificationNavigationClass.clearAppDataMethod(context: Get.context!);
  //   }
  // }

  // void _setNotifications() async {
  //   print("_setNotifications");
  //   // DynamicLinkProvider().initDynamicLinks();
  //   FirebaseMessagingService().foregroundNotification();
  //   FirebaseMessagingService().backgroundTapNotification();
  // }
}
