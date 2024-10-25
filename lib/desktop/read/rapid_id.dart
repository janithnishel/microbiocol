import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microbiocol/data/read_data.dart';
import 'package:microbiocol/desktop/read/rapid_id_view.dart';
import 'package:microbiocol/models/read_model.dart';
import 'package:microbiocol/utils/colors.dart';

class RapidId extends StatefulWidget {
  const RapidId({super.key});

  @override
  State<RapidId> createState() => _RapidIdState();
}

class _RapidIdState extends State<RapidId> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              child: DottedBorder(
                color: mprimaryColor, // Color of the dashed border
                strokeWidth: 2,
                dashPattern: const [6, 4], // Define dash pattern [line, space]
                borderType: BorderType.RRect,
                radius: const Radius.circular(16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Icon(
                              Icons.add,
                              color: mprimaryColor,
                              size: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  "Choose files from local",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: mprimaryColor,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 240,
                                color: mprimaryColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "or drop files here",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: mprimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 145,
              height: 56,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: mprimaryColor,
                    width: 3,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ignore: deprecated_member_use
                  SvgPicture.asset(
                    "assets/images/recent.svg",
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                    // ignore: deprecated_member_use
                    color: mprimaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: mprimaryColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.builder(
              itemCount: ReadData.ongoinReadDataList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 380,
                  mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                final data = ReadData.ongoinReadDataList[index];

                return _buildReadCard(data);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadCard(
    ReadModel data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ViewRapidIDDeatails(),
              ),
            );
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  data.imageUrl,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          data.id,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: mprimaryColor,
          ),
        ),
      ],
    );
  }
}
