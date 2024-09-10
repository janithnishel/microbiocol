import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/data/recent_card_data.dart';
import 'package:microbiocol/data/saved_item_data.dart';
import 'package:microbiocol/models/recent_card_model.dart';
import 'package:microbiocol/models/saved_item_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/lock_box.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // fetching data from recentcard class

  final recentData = RecentCardData().recentDataList;

// fetching data from savedItem class

  final savedData = SavedItemData().savedDataList;
  //check whether the free tire or premium
  final bool isFreeTire = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, Jhon",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Welcome back",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Recent",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: recentData.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      RecentCardModel data = recentData[index];

                      return _recentCard(data);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Quick Actions",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 2; i++)
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: i == 0
                              ? EdgeInsets.only(right: 8)
                              : EdgeInsets.only(left: 8),
                          child: CustomButton(
                            isHasWidget: true,
                            isHasBorder: false,
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                i == 0
                                    ? Image.asset(
                                        "assets/images/count.svg",
                                        fit: BoxFit.cover,
                                        width: 13,
                                        height: 13,
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Color(0xffFDFFFC),
                                          size: 15,
                                        ),
                                      ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  i == 0 ? "Count" : "Identify",
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
                      )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Saved",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: mprimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  child: Stack(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: savedData.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          SavedItemModel data = savedData[index];

                          return _savedItemList(data, context);
                        },
                      ),
                      if (isFreeTire == true)
                        lockBox(context, isFreeTire,
                            MediaQuery.of(context).size.height)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //create single recent card

  Widget _recentCard(RecentCardModel data) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CustommBox(
        isHasBoxShadow: false,
        isHasBorder: false,
        width: 115,
        height: 150,
        borderRadius: 16,
        color: mwhiteColor,
        widget: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        data.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 115,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [mprimaryColor.withOpacity(0), mprimaryColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.7, 1]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            data.microAnimalName,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: mwhiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //create single saved item details bar

  Widget _savedItemList(SavedItemModel data, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustommBox(
                isHasBoxShadow: false,
                isHasBorder: false,
                width: 64,
                height: 64,
                borderRadius: 42,
                color: mprimaryColor.withOpacity(0.1),
                widget: const Center(
                  child: Icon(
                    FontAwesomeIcons.folder,
                    color: mprimaryColor,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: mprimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      data.date,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: mprimaryColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
