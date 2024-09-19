import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class AddLabEquipment extends StatelessWidget {
  const AddLabEquipment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  titleBar(context, title: "Add Lab Equipment"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomForm(
                    noOfField: 4,
                    hintText: const [
                      "Equipment Name",
                      "Equipment Type",
                      "Count",
                      "Equipment Description"
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomButton(
                    isHasWidget: false,
                    isHasBorder: false,
                    title: "Add",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
