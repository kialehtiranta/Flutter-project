import 'package:flutter/material.dart';
import 'package:gift_app/widgets/giftForm.dart';
import 'package:gift_app/widgets/screenwrapper.dart';

class AddGiftWishScreen extends StatelessWidget {
  const AddGiftWishScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      subPage: true,
      title: "ADD NEW GIFT WISH",
      child: Container(
        padding: EdgeInsets.all(15.0),
        constraints: BoxConstraints(maxWidth: 800),
        child: Center(child: FormWidget()),
      ),
    );
  }
}
