import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class SearchDB extends StatelessWidget {
  const SearchDB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox(
                width: 520,
                child: CustomTextField(
                  hintText: "Search for organisms",
                  keyBoardType: TextInputType.text,
                  isHasSuffixIcon: true,
                  hintTextFontSize: 24,
                  textFontSize: 24,
                  verticalContentPadding: 12,
                  hintTextColor: mprimaryColor,
                  horizontalContentPadding: 15,
                  suffixConstrainHeight: 22,
                  boxConstraintsWidth: 60,
                  suffixIcon: Icon(
                    // ignore: deprecated_member_use
                    FontAwesomeIcons.search,
                    size: 22,
                    color: mprimaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.25),
              child: CustommBox(
                width: 355,
                height: 216,
                borderRadius: 8,
                color: mprimaryColor.withOpacity(0.1),
                widget: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.list_alt_sharp,
                      size: 105,
                      color: mprimaryColor,
                    ),
                    Text(
                      "Find information about organisms",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: mprimaryColor,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
                isHasBorder: false,
                isHasBoxShadow: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
