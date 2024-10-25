import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/data/recent_card_data.dart';
import 'package:microbiocol/data/saved_item_data.dart';
import 'package:microbiocol/data/stack_data.dart';
import 'package:microbiocol/models/recent_card_model.dart';
import 'package:microbiocol/models/saved_item_model.dart';
import 'package:microbiocol/models/stack_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';

class Home extends StatelessWidget {
  Home({super.key});
  // fetching data from recentcard class
  final recentData = RecentCardData().recentDataList;

  // fetching data from savedItem class
  final savedData = SavedItemData().savedDataList;

  // fetching data from stackData class
  final stackData = StackData().stackDataList;

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Jhon",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: mprimaryColor,
                        height: 0.7),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CustommBox(
                      width: 171,
                      height: 56,
                      borderRadius: 16,
                      color: mprimaryColor,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_upload_outlined,
                            size: 30,
                            color: mwhiteColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "New Scan",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: mwhiteColor,
                            ),
                          )
                        ],
                      ),
                      isHasBorder: false,
                      isHasBoxShadow: false,
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
              const Text(
                "Recent",
                style: TextStyle(
                    fontSize: 24,
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

                    return _buildRecentCard(data);
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Saved",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: mprimaryColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: savedData.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            SavedItemModel data = savedData[index];

                            return _buildSavedItemList(data, context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Stacks",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: mprimaryColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: stackData.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            StackModel data = stackData[index];

                            return _buildStackItem(data, context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //create single recent card
  Widget _buildRecentCard(RecentCardModel data) {
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
  Widget _buildSavedItemList(SavedItemModel data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustommBox(
            isHasBoxShadow: false,
            isHasBorder: false,
            width: 64,
            height: 64,
            borderRadius: 42,
            color: mprimaryColor.withOpacity(0.2),
            widget: const Center(
              child: Icon(
                FontAwesomeIcons.folder,
                color: mprimaryColor,
                size: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
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
          )
        ],
      ),
    );
  }

  //create single stack item details bar
  Widget _buildStackItem(StackModel data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustommBox(
            isHasBoxShadow: false,
            isHasBorder: false,
            width: 64,
            height: 64,
            borderRadius: 42,
            color: mprimaryColor.withOpacity(0.2),
            widget: Center(
              child: SvgPicture.asset(
                "assets/images/layer-group.svg",
                fit: BoxFit.cover,
                // ignore: deprecated_member_use
                color: mprimaryColor,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            data.stackName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: mprimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
