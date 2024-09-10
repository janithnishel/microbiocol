import 'package:flutter/material.dart';
import 'package:microbiocol/data/identification_data.dart';
import 'package:microbiocol/models/identification_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/tab_view.dart';

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
                  rightSideimage: "assets/images/count.svg",
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

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              minVerticalPadding: 10,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              // tileColor: maccentGreenColor,

                              visualDensity: const VisualDensity(vertical: 2),
                              title: Text(
                                data.title,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: mprimaryColor),
                              ),
                              subtitle: Text(
                                data.dateTime,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: mprimaryColor.withOpacity(0.5),
                                ),
                              ),
                              leading: CustommBox(
                                isHasBoxShadow: false,
                                width: 64,
                                height: 64,
                                borderRadius: 64,
                                color: mwhiteColor,
                                widget: ClipRRect(
                                  borderRadius: BorderRadius.circular(64),
                                  child: Image.asset(
                                    data.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                isHasBorder: false,
                              ),
                            ),
                          );
                        },
                      )
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
