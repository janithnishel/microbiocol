import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';

class ViewRapidIDDeatails extends StatefulWidget {
  const ViewRapidIDDeatails({super.key});

  @override
  State<ViewRapidIDDeatails> createState() => _ViewRapidIDDeatailsState();
}

class _ViewRapidIDDeatailsState extends State<ViewRapidIDDeatails> {
  // create the  key research topic list
  final List<String> topics = [
    "Lorem ipsum dolor sit amet",
    "Consectetur adipiscing elit"
  ];

  //track the clicked button
  // int _clickedIndex = 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
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
                    height: 310,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "assets/images/basillus.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 310,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Staphylococcus",
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                                color: mprimaryColor,
                                height: 0.7),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Basillus",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: mprimaryColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Staphylococcus is a genus of Gram-positive bacteria in the family Staphylococcaceae from the order Bacillales. Under the microscope, they appear spherical, and form in grape-like clusters. Staphylococcus species are facultative anaerobic organisms.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore...Read More.",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: mprimaryColor.withOpacity(0.8),
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < 2; i++)
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: i == 0
                                        ? const EdgeInsets.only(right: 8)
                                        : const EdgeInsets.only(left: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {},
                                        );
                                      },
                                      child: CustomButton(
                                        color: maccentBlueColor,
                                        borderRadius: 16,
                                        height: 56,
                                        isHasWidget: true,
                                        isHasBorder: false,
                                        widget: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            i == 0
                                                ? SvgPicture.asset(
                                                    "assets/images/template.svg",
                                                    fit: BoxFit.cover,
                                                    // ignore: deprecated_member_use
                                                    color: mwhiteColor,
                                                    width: 20,
                                                    height: 20,
                                                  )
                                                : SvgPicture.asset(
                                                    "assets/images/book-open.svg",
                                                    fit: BoxFit.cover,
                                                    // ignore: deprecated_member_use
                                                    color: mwhiteColor,
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              i == 0
                                                  ? "Attach to template"
                                                  : "Read",
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400,
                                                color: Color(
                                                  0xffFDFFFC,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "About",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Staphylococcus is a genus of Gram-positive bacteria in the family Staphylococcaceae from the order Bacillales. Under the microscope, they appear spherical, and form in grape-like clusters. Staphylococcus species are facultative anaerobic organisms.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Articles",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 1),
                      child: Text(
                        " ${i + 1}. Link ${i + 1}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: mprimaryColor,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Key Research Topics",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  for (int i = 0; i < 2; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 1),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 6,
                            color: mprimaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            topics[i],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: mprimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Uses",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Illnesses Caused",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor,
                    ),
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
