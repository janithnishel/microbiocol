import 'package:flutter/material.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class CustomForm extends StatelessWidget {
  final int noOfField;

  List<String> hintText = [];
  CustomForm({super.key, required this.noOfField, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < noOfField; i++)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextField(
              hintText: hintText[i],
              maxLines: noOfField - 1 == i ? 5 : null,
            ),
          ),
      ],
    );
  }
}
