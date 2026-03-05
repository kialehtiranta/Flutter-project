import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/models/models.dart';
import 'package:gift_app/widgets/gift.dart';

class Breakpoints {
  static const sm = 500;
  static const md = 800;
}

class GiftList extends StatelessWidget {
  final User user;
  final giftController = Get.find<GiftController>();

  GiftList(this.user);

  @override
  Widget build(BuildContext context) {
    final gifts = giftController.gifts;
    final size = MediaQuery.of(context).size;

    return Obx(
      () => GridView.count(
        crossAxisCount: size.width < Breakpoints.sm
            ? 1
            : size.width < Breakpoints.md
            ? 2
            : 3,
        padding: EdgeInsets.all(30),
        mainAxisSpacing: 30,
        crossAxisSpacing: 30,
        shrinkWrap: true,
        children: !gifts.containsKey(user)
            ? []
            : gifts[user]!
                  .map(
                    (gift) => InkWell(
                      onTap: () => Get.toNamed("/gifts/${gift.uuid}"),
                      child: Gift(gift),
                    ),
                  )
                  .toList(),
      ),
    );
  }
}
