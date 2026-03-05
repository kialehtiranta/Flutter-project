import 'package:flutter/material.dart';
import 'package:gift_app/models/models.dart';

class Gift extends StatelessWidget {
  final GiftWish giftWish;

  Gift(this.giftWish);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 208, 212, 214),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Text(
            giftWish.subject,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(giftWish.content, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
