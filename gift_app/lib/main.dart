import 'package:flutter/material.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/controllers/userController.dart';
// import 'package:gift_app/services/userService.dart';
import 'package:gift_app/services/giftService.dart';
import 'package:gift_app/widgets/giftForm.dart';
import 'package:gift_app/widgets/giftList.dart';
import 'package:gift_app/widgets/menuList.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'models/data.dart';

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
  final userController = Get.find<UserController>();
  final giftController = Get.find<GiftController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      home: Scaffold(
        appBar: AppBar(title: Text("MY GIFT WISHES")),
        drawer: Drawer(child: MenuList()),
        body: Container(
          alignment: Alignment.topCenter,
          width: 400,
          margin: const EdgeInsets.all(30),
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  giftController.gifts[user_0]?.length.toString() ?? "0",
                ),
              ),
              FormWidget(),
              GiftList(user_0),
              /*ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) =>
                      Padding(padding: EdgeInsets.all(16), child: FormWidget()),
                );
              },
              child: Text("Add"),
            ),*/
              //GiftList(userController.currentUser.value!),
            ],
          ),
        ),
      ),
    );
  }
}
