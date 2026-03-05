import 'package:get/get.dart';
import 'package:gift_app/models/models.dart';
import 'package:gift_app/services/giftService.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class GiftController {
  final giftService = Get.find<GiftService>();
  RxMap<User, List<GiftWish>> gifts;

  GiftController() : gifts = <User, List<GiftWish>>{}.obs {
    gifts.value = giftService.gifts;
  }

  void addGift(User user, String subject, String content) {
    final gift = GiftWish(uuid: uuid.v4(), subject: subject, content: content);
    if (gifts.containsKey(user)) {
      gifts[user]!.add(gift);
    } else {
      gifts[user] = [gift].obs;
    }
    gifts.refresh();
    giftService.saveGifts(gifts);
  }

  void deleteGift(User user, GiftWish gift) {
    if (gifts.containsKey(user)) {
      gifts[user] = gifts[user]!.where((g) => g.uuid != gift.uuid).toList();
      gifts.refresh();
      giftService.saveGifts(gifts);
    }
  }

  GiftWish? getGiftById(String id) {
    for (var giftList in gifts.values) {
      for (var gift in giftList) {
        if (gift.uuid == id) {
          return gift;
        }
      }
    }
    return null;
  }
}
