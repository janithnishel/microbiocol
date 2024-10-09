import 'package:flutter/material.dart';
import 'package:microbiocol/data/identification_data.dart';
import 'package:microbiocol/models/identification_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/tab_view.dart';
import 'package:microbiocol/widgets/tile.dart';

class Analyze extends StatefulWidget {
  const Analyze({
    super.key,
  });

  @override
  State<Analyze> createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
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
                  leftSideTitle: "Identifications",
                  leftSideIcon: Icons.camera_alt_outlined,
                  righttSideTitle: "Counts",
                  rightSideimage: "assets/images/abacus.svg",
                  onTap: (a) {
                    setState(() {
                      _isTap = a;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                _isTap == 0
                    ? ListView.builder(
                        itemCount: identificationData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          IdentificationModel data = identificationData[index];

                          return tile(data, true);
                        })
                    : const Center(
                        child: Text("No count "),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}