import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/controllers/userController.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});
  static final _formKey = GlobalKey<FormBuilderState>();
  final giftController = Get.find<GiftController>();
  final userController = Get.find<UserController>();

  void _clear() {
    _formKey.currentState?.reset();
  }

  void _submit(BuildContext context) async {
    if (_formKey.currentState?.saveAndValidate() == false) {
      return;
    }

    var result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Are you sure you want to add this gift wish?'),
        content: Text(_formKey.currentState?.value['text1'].toString() ?? ''),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    if (result == true) {
      giftController.addGift(
        userController.currentUser.value!,
        _formKey.currentState?.value['text1'] ?? '',
        _formKey.currentState?.value['text2'] ?? '',
      );
      _clear();
      Get.back();
    }
    debugPrint(_formKey.currentState?.value.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        spacing: 20,
        children: [
          FormBuilderTextField(
            name: 'text1',
            decoration: InputDecoration(
              hintText: 'Gift subject',
              border: OutlineInputBorder(),
            ),
            autovalidateMode: AutovalidateMode.always,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(3),
            ]),
          ),
          FormBuilderTextField(
            name: 'text2',
            decoration: InputDecoration(
              hintText: 'Describe your wish',
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            spacing: 20,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: _clear, child: Text("Clear")),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () => _submit(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
