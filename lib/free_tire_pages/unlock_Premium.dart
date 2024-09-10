import 'package:flutter/material.dart';
import 'package:microbiocol/data/subscription_data.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/utils/responsive.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';

class UnlockPremium extends StatefulWidget {
  const UnlockPremium({super.key});

  @override
  State<UnlockPremium> createState() => _UnlockPremiumState();
}

class _UnlockPremiumState extends State<UnlockPremium> {
//tracking the which package clicked

  int _isTapped = 0;

  @override
  Widget build(BuildContext context) {
    //Get the bool value by calling the "smallWidth" method depending on the screen size variation.
    bool responsive = Responsive.smallWidth(context);
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Unlock Counts with Premium",
                        style: TextStyle(
                          fontSize: responsive == true ? 20 : 24,
                          fontWeight: FontWeight.w700,
                          color: mprimaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.close,
                          size: responsive == true ? 20 : 24,
                          color: mprimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _billCard(
                        billingMethod: "Monthly",
                        billingPrice: 9.99,
                        billingStatus: "Billed Monthly",
                        responsive: responsive,
                        isHasSave: false,
                        isClick: 0,
                      ),
                      _billCard(
                        billingMethod: "Annual",
                        billingPrice: 79.99,
                        billingStatus: "Billed Annually",
                        responsive: responsive,
                        isHasSave: true,
                        isClick: 1,
                      )
                    ],
                  ),
                  for (int i = 0;
                      i < SubscriptionData.SubscriptionDataList.length;
                      i++)
                    _subscriptionDetails(i)
                ],
              ),
              const CustomButton(
                isHasWidget: false,
                isHasBorder: false,
                title: "Subscribe Now",
              ),
            ],
          ),
        ),
      ),
    );
  }

  //create a single billing card view
  Widget _billCard(
      {required String billingMethod,
      required double billingPrice,
      required String billingStatus,
      required bool responsive,
      required bool isHasSave,
      required int isClick}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = isClick;
        });
      },
      child: CustommBox(
        isHasBoxShadow: false,
        width: responsive == true ? 160 : 186,
        height: responsive == true ? 156 : 175,
        borderRadius: 8,
        color: _isTapped == isClick ? mprimaryColor : mwhiteColor,
        widget: Padding(
          padding: EdgeInsets.symmetric(
              vertical: responsive == true ? 10 : 20,
              horizontal: responsive == true ? 10 : 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        billingMethod,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: _isTapped == isClick
                              ? mwhiteColor
                              : mprimaryColor,
                        ),
                      ),
                      CustommBox(
                        isHasBoxShadow: false,
                        width: 20,
                        height: 20,
                        borderRadius: 100,
                        color: mwhiteColor,
                        widget: Center(
                            child: _isTapped == isClick
                                ? const Icon(
                                    Icons.check,
                                    size: 12,
                                    color: mprimaryColor,
                                  )
                                : null),
                        isHasBorder: _isTapped == isClick ? false : true,
                      )
                    ],
                  ),
                  Text(
                    "\$${billingPrice.toString()}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: _isTapped == isClick ? mwhiteColor : mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  isHasSave == true
                      ? const CustommBox(
                          isHasBoxShadow: false,
                          width: 76,
                          height: 20,
                          borderRadius: 8,
                          color: maccentGreenColor,
                          widget: Center(
                            child: Text(
                              "SAVE 33%",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: mwhiteColor,
                              ),
                            ),
                          ),
                          isHasBorder: false,
                        )
                      : const Text("")
                ],
              ),
              Text(
                billingStatus,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: _isTapped == isClick ? mwhiteColor : mprimaryColor,
                ),
              ),
            ],
          ),
        ),
        isHasBorder: true,
      ),
    );
  }

  //create the single row of subscription details
  Widget _subscriptionDetails(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: _isTapped == 0
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
