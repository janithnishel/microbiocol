import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/data/lab_setting_data.dart';
import 'package:microbiocol/models/lab_setting_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/tile.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class LabSetting extends StatelessWidget {
  LabSetting({super.key});

  //fetch the labsetting data

  final labSettingData = LabSettingData().LabSettingDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    titleBar(context, title: "Lab Settings"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        itemCount: labSettingData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          LabSettingModel data = labSettingData[index];
                          //This method includes details on the single row of the list view
                          return tile(
                            data,
                            false,
                            horizontal: 0,
                            icon: Icons.science_outlined,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      isHasWidget: false,
                      isHasBorder: false,
                      title: "Add New Equipment",
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
