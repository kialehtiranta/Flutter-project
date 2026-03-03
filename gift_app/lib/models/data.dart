import "package:flutter/material.dart";

import "models.dart";

final User user_0 = User(
  name: const Name(first: 'Matti', last: 'Möttönen'),
  giftWishes: [
    GiftWish(
      id: UniqueKey(),
      subject: 'Earth boardgame expansion',
      content: 'Earth: Abundance',
    ),
  ],
  avatarUrl: 'assets/avatar1.svg',
);
final User user_1 = User(
  name: const Name(first: 'Maija', last: 'Meikäläinen'),
  giftWishes: [],
  avatarUrl: 'assets/avatar2.svg',
);
final User user_2 = User(
  name: const Name(first: 'Pelle', last: 'Peloton'),
  giftWishes: [
    GiftWish(
      id: UniqueKey(),
      subject: 'Sleigh shovel',
      content: 'Something you can use to clear snow..',
    ),
  ],
  avatarUrl: 'assets/avatar3.svg',
);
