import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/controllers/userController.dart';
import 'package:gift_app/models/data.dart';

class MenuList extends StatelessWidget {
  final userList = [user_0, user_1, user_2];
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 30,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              spacing: 20,
              children: [
                Text(
                  "Current user:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => Text(userController.currentUser.value!.name.fullName),
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed("/friends"),
                  child: Text("Your friends"),
                ),
              ],
            ),
          ),
          Column(
            spacing: 20,
            children: [
              Text(
                "Switch user",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ...(userList.map(
                // take each item out of the list created by map (containing 3 ElevatedButtons), and insert them to the end of the children of the Column
                (user) => ElevatedButton(
                  onPressed: () => userController.setCurrentUser(user),
                  child: Text(user.name.fullName),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
