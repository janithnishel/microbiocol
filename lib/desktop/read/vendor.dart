import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/data/read_data.dart';
import 'package:microbiocol/data/vendor_data.dart';
import 'package:microbiocol/models/read_model.dart';
import 'package:microbiocol/models/vendor_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class Vendor extends StatelessWidget {
  const Vendor({super.key});

  @override
  Widget build(BuildContext context) {
    //initialize the value for when clicked the respective button
    int clickedIndex = 0;
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: SizedBox(
                width: 520,
                child: CustomTextField(
                  hintText: "Find for vendors",
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
            const SizedBox(
              height: 50,
            ),
            GridView.builder(
              itemCount: VendorData.venderDataList.length,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20,
                  mainAxisExtent: 220,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                final data = VendorData.venderDataList[index];

                return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: mwhiteColor,
                            content: StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return SizedBox(
                                  width: 800,
                                  height: 280,
                                  // color: mprimaryColor,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          for (int j = 0; j < 2; j++)
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  clickedIndex = j;
                                                });
                                              },
                                              child: Container(
                                                width: 110,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                    border: clickedIndex == j
                                                        ? const Border(
                                                            bottom: BorderSide(
                                                              color:
                                                                  mprimaryColor,
                                                              width: 3,
                                                            ),
                                                          )
                                                        : null),
                                                child: Center(
                                                  child: Text(
                                                    j == 0 ? "Reads" : "Counts",
                                                    style: const TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: mprimaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                        height: 175,
                                        child: ListView.builder(
                                          itemCount: clickedIndex == 0
                                              ? ReadData
                                                  .ongoinReadDataList.length
                                              : ReadData
                                                  .ongoinReadDataList.length,
                                          shrinkWrap: true,
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            final data = ReadData
                                                .ongoinReadDataList[index];

                                            return _buildTag(data);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: _buildVenderCard(data, context));
              },
            )
          ],
        ),
      ),
    );
  }
  //build the single vendor details card

  Widget _buildVenderCard(VendorModel data, BuildContext context) {
    return Card(
      color: mwhiteColor,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              data.imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 120,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data.vender,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: mprimaryColor,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }

  //build alert box data
  Widget _buildTag(ReadModel data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(
            data.imageUrl,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            data.id,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: mprimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
