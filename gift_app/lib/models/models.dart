import 'package:flutter/material.dart';

class GiftWish {
  const GiftWish({required this.id, required this.subject, required this.content});
  final UniqueKey id;
  final String subject;
  final String content;
}

class Name {
  const Name({required this.first, required this.last});

  final String first;
  final String last;
  String get fullName => '$first $last';
}

class User {
  const User({
    required this.name,
    required this.avatarUrl,
    required this.giftWishes,
  });
  final List<GiftWish> giftWishes;
  final Name name;
  final String avatarUrl;
}
