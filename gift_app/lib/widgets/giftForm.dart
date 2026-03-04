import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:gift_app/controllers/giftController.dart';
import 'package:gift_app/models/data.dart';

class FormWidget extends StatelessWidget {
  static final _formKey = GlobalKey<FormBuilderState>();
  final giftController = Get.find<GiftController>();

  _clear() {
    _formKey.currentState?.reset();
  }

  _submit() {
    _formKey.currentState?.saveAndValidate();
    giftController.addGift(
      user_0, // TODO: use current user
      _formKey.currentState?.value['text1'] ?? '',
      _formKey.currentState?.value['text2'] ?? '',
    );
    _clear();
    print(_formKey.currentState?.value);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Text("Add a gift wish"),
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
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: _clear, child: Text("Clear")),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
