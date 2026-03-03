import 'package:flutter/material.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/controllers/userController.dart';
import 'package:gift_app/widgets/giftList.dart';
import 'package:gift_app/widgets/menuList.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

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
  Get.lazyPut<GiftController>(() => GiftController());

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      home: Scaffold(
        appBar: AppBar(title: Text("MY GIFT WISHES")),
        drawer: Drawer(child: MenuList()),
        body: Obx(() => GiftList(userController.currentUser.value!)),
      ),
    );
  }
}
