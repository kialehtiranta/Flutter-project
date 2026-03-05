import 'package:flutter/material.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/controllers/userController.dart';
import 'package:gift_app/pages/addGiftWishScreen.dart';
import 'package:gift_app/pages/friendsScreen.dart';
import 'package:gift_app/pages/giftScreen.dart';
import 'package:gift_app/pages/homeScreen.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:gift_app/services/giftService.dart';
// import 'package:gift_app/services/userService.dart';

import 'dart:ui';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.lazyPut<UserController>(() => UserController());
  // Get.lazyPut<UserService>(() => UserService());
  Get.lazyPut<GiftController>(() => GiftController());
  Get.lazyPut<GiftService>(() => GiftService());

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/addnew", page: () => AddGiftWishScreen()),
        GetPage(name: "/gifts/:giftId", page: () => GiftScreen()),
        GetPage(name: "/friends", page: () => FriendsScreen()),
      ],
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
