import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/models/models.dart';
import 'package:gift_app/widgets/gift.dart';

class GiftList extends StatelessWidget {
  final User user;
  final giftController = Get.find<GiftController>();

  GiftList(this.user);

  @override
  Widget build(BuildContext context) {
    final gifts = giftController.gifts;
    if (!gifts.containsKey(user)) {
      return Text("No wishes");
    }
    return Obx(
      () => GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(30),
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        shrinkWrap: true,
        children: gifts[user]!.map((gift) => Gift(gift)).toList(),
      ),
    );
  }
}
