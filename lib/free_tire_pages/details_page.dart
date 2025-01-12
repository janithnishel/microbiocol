import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/lock_box.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //this global key can track teh exact height of the container
  final GlobalKey _detailsPageContainerKey = GlobalKey();
  double _containerHeight = 0; // store the exact height of container

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _measureContainerHeight();
      },
    );
  }

  void _measureContainerHeight() {
    final RenderBox renderBox = _detailsPageContainerKey.currentContext
        ?.findRenderObject() as RenderBox;
    setState(
      () {
        _containerHeight = renderBox.size.height;
      },
    );
  }

  int clickIndex = 0;
  @override
  Widget build(BuildContext context) {
    // create the  key research topic list
    final List<String> topics = [
      "Lorem ipsum dolor sit amet",
      "Consectetur adipiscing elit"
    ];
    //check whether the free tire or premium
    bool isFreeTire = checkTire();

    //store the click button index

    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 12,
                      color: mprimaryColor,
                    ),
                    Icon(
                      Icons.share_outlined,
                      size: 20,
                      color: mprimaryColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/images/basillus.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Staphylococcus",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: mprimaryColor),
                            ),
                            const Text(
                              "Basillus",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: mprimaryColor),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Staphylococcus is a genus of Gram-positive bacteria in the family Staphylococcaceae from the order Bacillales. Under the microscope, they appear spherical, and form in grape-like clusters. Staphylococcus species are facultative anaerobic organisms.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore...Read More.",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: mprimaryColor.withOpacity(0.8),
                              ),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
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
                              setState(() {
                                clickIndex = i;
                                showBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        border: Border(
                                          top: BorderSide(
                                            color: mBlack.withOpacity(0.15),
                                            width: 1,
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  mtextColor.withOpacity(0.15),
                                              offset: const Offset(0, 2),
                                              blurRadius: 20,
                                              spreadRadius: 4),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, top: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "dfasd",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: mBlack,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    if (Navigator.canPop(
                                                        context)) {
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: const Icon(Icons.close,
                                                      size: 16, color: mBlack),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                            },
                            child: CustomButton(
                              color: clickIndex == i
                                  ? maccentBlueColor
                                  : mprimaryColor,
                              isHasWidget: true,
                              isHasBorder: false,
                              widget: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  i == 0
                                      ? SvgPicture.asset(
                                          "assets/images/abacus.svg",
                                          fit: BoxFit.cover,
                                          // ignore: deprecated_member_use
                                          color: mwhiteColor,
                                          width: 16,
                                          height: 16,
                                        )
                                      : const Padding(
                                          padding: EdgeInsets.only(top: 2),
                                          child: Icon(
                                            Icons.create_new_folder_outlined,
                                            color: Color(0xffFDFFFC),
                                            size: 15,
                                          ),
                                        ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    i == 0 ? "Count" : "Add to Folder",
                                    style: const TextStyle(
                                      fontSize: 16,
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  key: _detailsPageContainerKey,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: mwhiteColor,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Staphylococcus is a genus of Gram-positive bacteria in the family Staphylococcaceae from the order Bacillales. Under the microscope, they appear spherical, and form in grape-like clusters. Staphylococcus species are facultative anaerobic organisms.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Articles",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          for (int i = 0; i < 2; i++)
                            Padding(
                              padding: const EdgeInsets.only(left: 5, top: 1),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    size: 6,
                                    color: mprimaryColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    topics[i],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Illnesses Caused",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: mprimaryColor,
                            ),
                          ),
                        ],
                      ),
                      if (isFreeTire == true) lockBox(context, _containerHeight)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
