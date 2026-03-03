import 'package:get/get.dart';
import 'package:gift_app/models/data.dart';
import 'package:gift_app/models/models.dart';

class UserController {
  Rx<User?> currentUser;

  UserController() : currentUser = user_0.obs;

  void setCurrentUser(User user) {
    currentUser.value = user;
  }
}
