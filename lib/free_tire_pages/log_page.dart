import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/data/identification_data.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/tab_view.dart';

class Log extends StatefulWidget {
  Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  // fetch the identification details from identification class

  final identificationData = IdentificationData().IdentificationDataList;

  // store the clickable button index

  int _isTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                TabView(
                  leftSideTitle: "Stacks Log",
                  leftSideIcon: Icons.my_library_add_outlined,
                  RighttSideTitle: "Counts Log",
                  RightSideimage: "assets/images/count.svg",
                  onTap: (a) {
                    setState(
                      () {
                        _isTap = a;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                _isTap == 0 ? Text("dd") : Text("sddfdff"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
