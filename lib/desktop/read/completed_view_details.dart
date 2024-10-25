import 'package:flutter/material.dart';
import 'package:microbiocol/models/read_model.dart';
import 'package:microbiocol/utils/colors.dart';

class CompletedViewDetails extends StatefulWidget {
  final ReadModel data;
  final int clickIndex;
  const CompletedViewDetails({
    super.key,
    required this.data,
    required this.clickIndex,
  });

  @override
  State<CompletedViewDetails> createState() => _CompletedViewDetailsState();
}

class _CompletedViewDetailsState extends State<CompletedViewDetails> {
// create the title list

  final List<String> data = [
    "Started Date",
    "Started Time",
    "Incubation Started",
    "Analyst",
  ];

//Create the sample hardcoded result corresponding to each title

  final List<String> result = [
    "06 Jul 2024",
    "1200",
    "Anaysty TID",
    "TID",
  ];

  //track TSA OR SDA
  bool isTSA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 20,
                      color: mprimaryColor,
                    ),
                  ),
                  const Icon(
                    Icons.share_outlined,
                    size: 40,
                    color: mprimaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.data.imageUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.id,
                          style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: mprimaryColor,
                              height: 0.7),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Lighting - LI6897",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: mprimaryColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.clickIndex == 0
                              ? "TSA review required | SDA review required"
                              : "Completed",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: widget.clickIndex == 0
                                  ? maccentBlueColor
                                  : maccentGreenColor),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Wrap(
                spacing: 30.0,
                runSpacing: 8.0,
                children: [
                  for (int i = 0; i < data.length; i++)
                    SizedBox(
                      width: i == 0
                          ? 275
                          : i == 1
                              ? 219
                              : i == 2
                                  ? 335
                                  : 125,
                      child: Row(
                        children: [
                          Text(
                            data[i],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            result[i],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: mprimaryColor,
                            ),
                          ),
                          SizedBox(width: i < (data.length - 1) ? 30 : 0),
                          if (i < data.length - 1)
                            Container(
                              width: 2,
                              height: 24,
                              color: mprimaryColor,
                            )
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Wrap(
                spacing: 50,
                runSpacing: 50,
                children: [
                  _buildTag("Incubation Conditions", ["3 - 5 Days", "32.5°C"],
                      ["5 - 7 Days", "22.5°C"], 0),
                  widget.clickIndex == 1
                      ? _buildTag(
                          "Completed On",
                          ["09 Jul 2024", "1200 by TID"],
                          ["11 Jul 2024", "1200 by TID"],
                          1)
                      : _buildTag("When Readable", ["Read Completed"],
                          ["11 Jul 2024 1200 to 13 Jul 2024 1200"], 1),
                  widget.clickIndex == 1
                      ? _buildTag("Counts", ["0 CFU"], ["0 CFU"], 2)
                      : _buildTag(
                          "Countdown",
                          ["Read by analyst KEP 10 Jul 2024 1000"],
                          ["Readable in 1hr 45mins"],
                          2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //build one details block

  Widget _buildTag(
      String title, List<String> tsa, List<String> sda, int index) {
    return SizedBox(
      width: index == 0
          ? 260
          : index == 1
              ? 411
              : 411,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: mprimaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          for (int j = 0; j < 2; j++)
            Padding(
              padding: EdgeInsets.only(bottom: j == 0 ? 5 : 0),
              child: Row(
                children: [
                  Text(
                    j == 0 ? "TSA" : "SDA",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(width: 15),
                  for (int i = 0; i < tsa.length; i++)
                    Padding(
                      padding: EdgeInsets.only(right: i == 0 ? 15 : 0),
                      child: Text(
                        j == 0 ? tsa[i] : sda[i],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: j == 0
                              ? tsa[i] == "Read Completed"
                                  ? maccentGreenColor
                                  : mprimaryColor
                              : null,
                        ),
                      ),
                    ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
