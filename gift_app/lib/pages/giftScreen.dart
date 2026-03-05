import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/giftController.dart';
import '../widgets/screenwrapper.dart';

class GiftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var giftId = Get.parameters["giftId"];

    return ScreenWrapper(
      subPage: true,
      title: "GIFT WISH",
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(child: Expanded(flex: 1, child: GiftWrapper(giftId))),
      ),
    );
  }
}

class GiftWrapper extends StatelessWidget {
  final String? giftId;
  final giftController = Get.find<GiftController>();

  GiftWrapper(this.giftId);

  @override
  Widget build(BuildContext context) {
    if (giftId == null) {
      return Text("Gift not found");
    }

    var gift = giftController.getGiftById(giftId!);

    if (gift == null) {
      return Text("Gift not found");
    }

    return Container(
      color: Colors.grey[200],
      child: Column(
        spacing: 30,
        children: [
          Text(
            "Name: ${gift.subject}",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text("Description: ${gift.content}", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
