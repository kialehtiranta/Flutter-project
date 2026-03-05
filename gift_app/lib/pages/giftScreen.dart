import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/models/models.dart';

import '../controllers/giftController.dart';
import '../widgets/screenwrapper.dart';

class GiftScreen extends StatelessWidget {
  final giftController = Get.find<GiftController>();
  final giftId = Get.parameters["giftId"];

  GiftWish? gift2;

  GiftScreen() {
    for (var giftList in giftController.gifts.values) {
      for (var gift in giftList) {
        if (gift.uuid == giftId) {
          gift2 = gift;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      subPage: true,
      title: "GIFT WISH",
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[200],
              child: gift2 == null
                  ? Text("Gift not found")
                  : Column(
                      spacing: 30,
                      children: [
                        Text(
                          "Name: ${gift2!.subject}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Description: ${gift2!.content}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
