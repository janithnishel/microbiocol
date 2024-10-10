import 'package:flutter/material.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class CustomForm extends StatelessWidget {
  final int noOfField;
  final List<String> hintText;
  final List<TextEditingController> controllers; // Added final here to store the controllers

  CustomForm({
    super.key,
    required this.noOfField,
    required this.hintText,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < noOfField; i++)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextField(
              controller: controllers[i], // Link controller to the text field
              hintText: hintText[i],
              maxLines: noOfField - 1 == i ? 5 : null, // Allow multi-line for the last field
            ),
          ),
      ],
    );
  }
}