import 'package:flutter/material.dart';
import 'package:microbiocol/data/subscription_data.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
//tracking the clickable value;
  int _onTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                titleBar(
                  context,
                  title: "Subscriptions",
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    optionButton("Free", 48,
                        0), // Calling the method and passing the appropriate parameters
                    const SizedBox(
                      width: 10,
                    ),
                    optionButton("Premium", 80, 1)
                  ],
                ),
                for (int i = 0;
                    i < SubscriptionData.SubscriptionDataList.length;
                    i++)
                  _subscriptionDetails(i)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // create the single buttton
  Widget optionButton(String title, double width, int index) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _onTap = index;
          },
        );
      },
      child: CustommBox(
        isHasBoxShadow: false,
        width: width,
        height: 32,
        borderRadius: 8,
        color: _onTap == index
            ? maccentGreenColor
            : maccentGreenColor.withOpacity(0.25),
        widget: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: mprimaryColor,
            ),
          ),
        ),
        isHasBorder: false,
      ),
    );
  }

  //create the single row of subscription details
  Widget _subscriptionDetails(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: _onTap == 0
          ? Row(
              children: [
                const Icon(
                  Icons.check_sharp,
                  color: mprimaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  SubscriptionData.SubscriptionDataList[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: mprimaryColor,
                  ),
                )
              ],
            )
          : const Center(
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: mprimaryColor,
                ),
              ),
            ),
    );
  }
}
