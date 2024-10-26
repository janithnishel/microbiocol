import 'package:flutter/material.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/data/subscription_data.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/title_bar.dart';
import 'package:microbiocol/widgets/unlock_premium.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  //identify the current tier

  final bool _isTier = checkTire();
  //track the current page in page view
  int _currentPage = 99;
  //craete the page controller
  final PageController _pageconrol = PageController();
//tracking the clickable value;
  int _onTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
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
              const SizedBox(
                height: 10,
              ),
              _onTap == 0
                  ? Expanded(
                      child: Column(
                        children: [
                          for (int i = 0;
                              i < SubscriptionData.freePackageDataList.length;
                              i++)
                            _subscriptionDetails(i),
                          const Spacer(),
                          if (!_isTier)
                            const CustomButton(
                              isHasWidget: false,
                              isHasBorder: false,
                              title: "Unsubscribe Current Plan",
                            )
                        ],
                      ),
                    )
                  : Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            PageView(
                              controller: _pageconrol,
                              onPageChanged: (value) {
                                setState(() {
                                  _currentPage = value;
                                });
                              },
                              children: [
                                UnlockPremium(
                                  role: "Tech",
                                  packageDetails:
                                      SubscriptionData.techPackageDataList,
                                  monthlyPrice: 9.99,
                                  annuallyPrice: 115,
                                ),
                                UnlockPremium(
                                  role: "Analyst",
                                  packageDetails:
                                      SubscriptionData.analystPackageDataList,
                                  monthlyPrice: 29.99,
                                  annuallyPrice: 355,
                                ),
                                UnlockPremium(
                                  role: "Scientist",
                                  packageDetails:
                                      SubscriptionData.scientistPackageDataList,
                                  monthlyPrice: 59.99,
                                  annuallyPrice: 715,
                                ),
                              ],
                            ),
                            Positioned(
                              top: _currentPage == 0
                                  ? 250.toInt() +
                                      (SubscriptionData
                                              .techPackageDataList.length *
                                          25)
                                  : _currentPage == 1
                                      ? 250.toInt() +
                                          (SubscriptionData
                                                  .analystPackageDataList
                                                  .length *
                                              25)
                                      : 250.toDouble() +
                                          (SubscriptionData
                                                  .scientistPackageDataList
                                                  .length *
                                              25),
                              left: MediaQuery.of(context).size.width * 0.375,
                              child: SmoothPageIndicator(
                                controller: _pageconrol,
                                count: 3,
                                effect: const ExpandingDotsEffect(
                                  dotColor: Colors.grey,
                                  activeDotColor: mprimaryColor,
                                  dotWidth: 6,
                                  dotHeight: 4,
                                  expansionFactor: 5.5,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              if (_onTap == 1)
                const CustomButton(
                  isHasWidget: false,
                  isHasBorder: false,
                  title: "Subscribe Now",
                )
            ],
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
      child: Row(
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
            SubscriptionData.freePackageDataList[index].title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: mprimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
