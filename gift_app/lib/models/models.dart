class GiftWish {
  const GiftWish({
    required this.uuid,
    required this.subject,
    required this.content,
  });
  final String uuid;
  final String subject;
  final String content;

  factory GiftWish.fromJson(Map json) {
    return GiftWish(
      uuid: json['uuid'],
      subject: json['subject'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'subject': subject, 'content': content, "uuid": uuid};
  }
}

class Name {
  const Name({required this.first, required this.last});

  final String first;
  final String last;
  String get fullName => '$first $last';
}

class User {
  const User({required this.name, required this.avatarUrl});
  final Name name;
  final String avatarUrl;

  bool operator ==(Object other) =>
      other is User && name.fullName == other.name.fullName;

  int get hashCode => Object.hash(name.fullName.hashCode, avatarUrl.hashCode);

  factory User.fromJson(Map json) {
    return User(
      name: Name(first: json['first'], last: json['last']),
      avatarUrl: json['avatarUrl'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'first': name.first, 'last': name.last, 'avatarUrl': avatarUrl};
  }
}
