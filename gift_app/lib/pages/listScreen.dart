import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/models/data.dart';
import 'package:gift_app/widgets/giftList.dart';
import 'package:gift_app/widgets/screenwrapper.dart';

import '../controllers/giftController.dart';

class ListScreen extends StatelessWidget {
  final giftController = Get.find<GiftController>();

  @override
  Widget build(BuildContext context) {
    String? userId = Get.parameters["id"];
    return ScreenWrapper(
      subPage: true,
      title: "GIFT WISHES",
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "${users.firstWhere((u) => u.id == userId).name.fullName}'s gift wishes",
              textAlign: TextAlign.center,
            ),
          ),
          Obx(
            () => Text(
              "Total wishes: ${giftController.gifts[users.firstWhere((u) => u.id == userId)]?.length ?? 0}",
            ),
          ),
          Expanded(child: GiftList(users.firstWhere((u) => u.id == userId))),
        ],
      ),
    );
  }
}
