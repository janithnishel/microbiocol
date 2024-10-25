import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microbiocol/data/read_data.dart';
import 'package:microbiocol/desktop/read/completed_view_details.dart';
import 'package:microbiocol/models/read_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';

class HomeRead extends StatefulWidget {
  const HomeRead({super.key});

  @override
  State<HomeRead> createState() => _HomeReadState();
}

class _HomeReadState extends State<HomeRead> {
  //custom templates deatails
  static final List<String> customTemplates = [
    "Template 1",
    "Template 2",
    "Template 2",
    "Template 2",
    "Template 2",
    "Template 2",
    "Template 2",
    "Template 2",
  ];

  //general templates deatails
  static final List<String> generalTemplates = [
    "General 1",
    "General 2",
  ];
  //initialize the value for when clicked the respective button
  int _clickedIndex = 0;

  int _clickedTemplateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi, Jhon",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: mprimaryColor,
                        height: 0.7),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: mwhiteColor,
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return SizedBox(
                                    width: 800,
                                    height: 280,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            for (int j = 0; j < 2; j++)
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _clickedTemplateIndex = j;
                                                  });
                                                },
                                                child: Container(
                                                  width: 225,
                                                  height: 56,
                                                  decoration: BoxDecoration(
                                                      border:
                                                          _clickedTemplateIndex ==
                                                                  j
                                                              ? const Border(
                                                                  bottom:
                                                                      BorderSide(
                                                                    color:
                                                                        mprimaryColor,
                                                                    width: 3,
                                                                  ),
                                                                )
                                                              : null),
                                                  child: Center(
                                                    child: Text(
                                                      j == 0
                                                          ? "Custom Templates"
                                                          : "General Template",
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
                                            itemCount:
                                                _clickedTemplateIndex == 0
                                                    ? customTemplates.length
                                                    : generalTemplates.length,
                                            shrinkWrap: true,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/images/template.svg",
                                                      fit: BoxFit.cover,
                                                      width: 32,
                                                      height: 40,
                                                      // ignore: deprecated_member_use
                                                      color: mprimaryColor,
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      _clickedTemplateIndex == 0
                                                          ? customTemplates[
                                                              index]
                                                          : generalTemplates[
                                                              index],
                                                      style: const TextStyle(
                                                        color: mprimaryColor,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
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
                      child: const CustommBox(
                        width: 171,
                        height: 56,
                        borderRadius: 16,
                        borderWidth: 2,
                        color: mwhiteColor,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 30,
                              color: mprimaryColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "New Read",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                color: mprimaryColor,
                              ),
                            )
                          ],
                        ),
                        isHasBorder: true,
                        isHasBoxShadow: false,
                      ),
                    ),
                  )
                ],
              ),
              const Text(
                "Welcome back",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: mprimaryColor,
                    height: -0.1),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  for (int i = 0; i < 2; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _clickedIndex = i;
                        });
                      },
                      child: Container(
                        width: 188,
                        height: 56,
                        decoration: BoxDecoration(
                            border: _clickedIndex == i
                                ? const Border(
                                    bottom: BorderSide(
                                      color: mprimaryColor,
                                      width: 3,
                                    ),
                                  )
                                : null),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            i == 0
                                ? SvgPicture.asset(
                                    "assets/images/spinner-alt.svg",
                                    fit: BoxFit.cover,
                                    width: 20,
                                    height: 20,
                                  )
                                : const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: mprimaryColor,
                                  ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              i == 0 ? "Ongoing" : "Completed",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: mprimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GridView.builder(
                itemCount: _clickedIndex == 0
                    ? ReadData.ongoinReadDataList.length
                    : ReadData.completedReadDataList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 380,
                    mainAxisSpacing: 15),
                itemBuilder: (context, index) {
                  final data = _clickedIndex == 0
                      ? ReadData.ongoinReadDataList[index]
                      : ReadData.completedReadDataList[index];

                  return _buildReadCard(data, index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadCard(ReadModel data, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
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
            InkWell(
              onTap: () => _clickedIndex == 0
                  ? Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            CompletedViewDetails(
                          data: data,
                          clickIndex: _clickedIndex,
                        ),
                      ),
                    )
                  : null,
              child: CustommBox(
                width: 300,
                height: 300,
                borderRadius: 8,
                color: mprimaryColor.withOpacity(0.7),
                widget: _clickedIndex == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: LinearProgressIndicator(
                              backgroundColor: mwhiteColor,
                              borderRadius: BorderRadius.circular(4),
                              value: data.progressValue,
                              valueColor: const AlwaysStoppedAnimation(
                                  maccentGreenColor),
                              minHeight: 4,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Readable in\n${data.readableValue}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFDFFFC),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {},
                              );

                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      CompletedViewDetails(
                                    data: data,
                                    clickIndex: _clickedIndex,
                                  ),
                                ),
                              );
                            },
                            child: const CustomButton(
                              isHasWidget: false,
                              isHasBorder: false,
                              color: mwhiteColor,
                              height: 56,
                              width: 86,
                              borderRadius: 16,
                              fontSize: 24,
                              title: "View",
                              textColor: mprimaryColor,
                            ),
                          ),
                        ],
                      ),
                isHasBorder: false,
                isHasBoxShadow: false,
              ),
            ),
          ],
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
