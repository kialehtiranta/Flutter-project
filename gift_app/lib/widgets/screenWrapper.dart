import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_app/widgets/menuList.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final bool subPage;

  const ScreenWrapper({
    super.key,
    required this.child,
    required this.subPage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text(title),
            leading: subPage
                ? IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Get.back(),
                  )
                : null,
          ),
          drawer: Drawer(child: MenuList()),
          body: Container(
            alignment: Alignment.topCenter,
            constraints: BoxConstraints(maxWidth: 1200),
            child: child,
          ),
        ),
      ),
    );
  }
}
