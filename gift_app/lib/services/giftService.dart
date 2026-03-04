import 'package:gift_app/models/models.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class GiftService {
  final storage = Hive.box("storage");

  Map<User, List<GiftWish>> get gifts {
    if (storage.containsKey('gifts')) {
      List<dynamic> gifts = storage.get('gifts');
      return Map.fromEntries(
        gifts.map(
          (e) => MapEntry(
            User.fromJson(e['user']),
            List<GiftWish>.from(e['gifts'].map((g) => GiftWish.fromJson(g))),
          ),
        ),
      );
    } else {
      return <User, List<GiftWish>>{};
    }
  }

  void saveGifts(Map<User, List<GiftWish>> gifts) {
    storage.put(
      'gifts',
      gifts.entries
          .map(
            (e) => {
              'user': e.key.toJson(),
              'gifts': e.value.map((g) => g.toJson()).toList(),
            },
          )
          .toList(),
    );
  }
}
