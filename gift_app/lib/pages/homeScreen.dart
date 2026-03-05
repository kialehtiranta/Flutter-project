import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/widgets/giftList.dart';
import 'package:gift_app/widgets/screenwrapper.dart';

import '../controllers/giftController.dart';
import '../controllers/userController.dart';

class HomeScreen extends StatelessWidget {
  final giftController = Get.find<GiftController>();
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    // final device = MediaQuery.of(context).size; TODO: use this for responsive design
    return ScreenWrapper(
      subPage: false,
      title: "MY GIFT WISHES",
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "You can use this application to list your gift wishes, and see the gift wishes of your friends",
              textAlign: TextAlign.center,
            ),
          ),
          Obx(
            () => Text(
              "Total wishes: ${giftController.gifts[userController.currentUser.value]?.length ?? 0}",
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () => Get.toNamed("/addnew"),
              child: const Text("Add new"),
            ),
          ),
          Expanded(
            child: Obx(() => GiftList(userController.currentUser.value!)),
          ),
        ],
      ),
    );
  }
}
