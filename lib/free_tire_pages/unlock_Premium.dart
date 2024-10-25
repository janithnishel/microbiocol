import 'package:flutter/material.dart';
import 'package:microbiocol/data/subscription_data.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/utils/responsive.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/api_services/apiservice.dart'; // Import ApiService
import 'package:microbiocol/global.dart' as globals; // Import globals for userId and token

class UnlockPremium extends StatefulWidget {
  const UnlockPremium({super.key});

  @override
  State<UnlockPremium> createState() => _UnlockPremiumState();
}

class _UnlockPremiumState extends State<UnlockPremium> {
  int _isTapped = 0; // 0 for Monthly, 1 for Annual
  bool _isLoading = false; // For loading indicator when submitting

  // Subscription data
  String _subscriptionType = 'Tech'; // Example subscription type
  String _billingFrequency = 'monthly'; // Default to monthly
  double _subscriptionPrice = 9.99; // Monthly price
  int _idsPerMonth = 10;
  double _savingsPercentage = 0.0;
  int _freeIdCount = 5;
  int _purchasedIdCount = 0;

  // Method to handle subscription submission
  Future<void> _submitSubscription() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Fetch userId from globals
    int? userId = globals.userId;

    if (userId == null) {
      print("User ID not available");
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
      return;
    }

    // Submit subscription details using ApiService
    bool success = await ApiService.submitSubscription(
      userId: userId,
      subscriptionType: _subscriptionType,
      billingFrequency: _billingFrequency,
      subscriptionPlan: 'premium',
      subscriptionPrice: _subscriptionPrice,
      idsPerMonth: _idsPerMonth,
      savingsPercentage: _savingsPercentage,
      subscriptionEndDate: '2024-11-25T09:10:17.399Z', // Example end date
      freeIdCount: _freeIdCount,
      purchasedIdCount: _purchasedIdCount,
    );

    setState(() {
      _isLoading = false; // Hide loading indicator
    });

    if (success) {
      print("Subscription submitted successfully");
    } else {
      print("Failed to submit subscription");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          fontSize: responsive ? 20 : 24,
                          fontWeight: FontWeight.w700,
                          color: mprimaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.close,
                          size: responsive ? 20 : 24,
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
                  for (int i = 0; i < SubscriptionData.SubscriptionDataList.length; i++)
                    _subscriptionDetails(i),
                ],
              ),
              _isLoading
                  ? const CircularProgressIndicator() // Show loader if the subscription is being submitted
                  : CustomButton(
                      isHasWidget: false,
                      isHasBorder: false,
                      title: "Subscribe Now",
                      onTap: _submitSubscription, // Call subscription submission on tap
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Create a single billing card view
  Widget _billCard({
    required String billingMethod,
    required double billingPrice,
    required String billingStatus,
    required bool responsive,
    required bool isHasSave,
    required int isClick,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = isClick;
          _billingFrequency = isClick == 0 ? 'monthly' : 'annually';
          _subscriptionPrice = isClick == 0 ? 9.99 : 79.99; // Change price based on selection
          _savingsPercentage = isClick == 1 ? 33.0 : 0.0; // Annual plan has savings
        });
      },
      child: CustommBox(
        isHasBoxShadow: false,
        width: responsive ? 160 : 186,
        height: responsive ? 156 : 175,
        borderRadius: 8,
        color: _isTapped == isClick ? mprimaryColor : mwhiteColor,
        widget: Padding(
          padding: EdgeInsets.symmetric(
              vertical: responsive ? 10 : 20,
              horizontal: responsive ? 10 : 20),
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
                          color: _isTapped == isClick ? mwhiteColor : mprimaryColor,
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
                  isHasSave
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
                      : const Text(""),
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

  // Create the single row of subscription details
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