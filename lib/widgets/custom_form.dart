import 'package:flutter/material.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class CustomForm extends StatelessWidget {
  final int noOfField;
  final List<String> hintText;
  final List<TextEditingController> controllers;
  final List<String? Function(String?)?> validators;
  final List<TextInputType> inputTypes;

  CustomForm({
    super.key,
    required this.noOfField,
    required this.hintText,
    required this.controllers,
    required this.validators,
    required this.inputTypes,
  }) : assert(
            noOfField == hintText.length &&
            noOfField == controllers.length &&
            noOfField == validators.length &&
            noOfField == inputTypes.length,
            "The length of hintText, controllers, validators, and inputTypes should match noOfField.");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < noOfField; i++)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextField(
              hintText: hintText[i],
              controller: controllers[i],
              validator: validators[i],
              keyBoardType: inputTypes[i],
              maxLines: noOfField - 1 == i ? 5 : 1, // Adjust maxLines for the last field if necessary
            ),
          ),
      ],
    );
  }
}