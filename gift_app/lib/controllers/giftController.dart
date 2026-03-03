import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/models/data.dart';
import 'package:gift_app/models/models.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class GiftController {
  final storage = Hive.box("storage");

  var gifts = <User, List<GiftWish>>{};

  GiftController() : gifts = <User, List<GiftWish>>{}.obs {
    gifts = storage.get('gifts') ?? {};
    gifts[user_0] = [
      GiftWish(id: UniqueKey(), subject: "blöö", content: "derp"),
    ];
  }

  void addGift(User user, String subject, String content) {
    final gift = GiftWish(id: UniqueKey(), subject: subject, content: content);
    if (gifts.containsKey(user)) {
      gifts[user]!.add(gift);
    } else {
      gifts[user] = [gift];
    }
    storage.put("gifts", gifts);
  }

  void deleteGift(User user, GiftWish gift) {
    if (gifts.containsKey(user)) {
      gifts[user] = gifts[user]!.where((g) => g.id != gift.id).toList();
      storage.put("gifts", gifts);
    }
  }
}
