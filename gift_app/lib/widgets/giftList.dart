import 'package:flutter/material.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/models/models.dart';
import 'package:gift_app/widgets/gift.dart';

class GiftList extends StatelessWidget {
  final User user;
  final gifts = GiftController().gifts;

  GiftList(this.user);

  @override
  Widget build(BuildContext context) {
    if (!gifts.containsKey(user)) {
      return Text("No wishes");
    }
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(30),
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      children: gifts[user]!.map((gift) => Gift(gift)).toList(),
    );
  }
}
