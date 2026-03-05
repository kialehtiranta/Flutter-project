import "package:uuid/uuid.dart";

import "models.dart";

var uuid = Uuid();

final User user_0 = User(
  id: uuid.v4(),
  name: const Name(first: 'Matti', last: 'Möttönen'),
  avatarUrl: 'avatars/avatar1.svg',
);
final User user_1 = User(
  id: uuid.v4(),
  name: const Name(first: 'Maija', last: 'Meikäläinen'),
  avatarUrl: 'avatars/avatar2.svg',
);
final User user_2 = User(
  id: uuid.v4(),
  name: const Name(first: 'Pelle', last: 'Peloton'),
  avatarUrl: 'avatars/avatar3.svg',
);

final users = [user_0, user_1, user_2];
