import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/models/data.dart';

import '../controllers/userController.dart';
import '../widgets/screenwrapper.dart';

class FriendsScreen extends StatelessWidget {
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      subPage: true,
      title: "MY FRIENDS",
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Here you can see your friends"),
            Expanded(
              flex: 1,
              child: Obx(
                () => ListView(
                  children: [
                    ...users
                        .where(
                          (user) => user != userController.currentUser.value,
                        )
                        .map(
                          (user) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(user.avatarUrl),
                            ),
                            title: Text(user.name.fullName),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
