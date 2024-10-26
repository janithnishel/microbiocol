import 'package:flutter/material.dart';
import 'package:microbiocol/models/subscription_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/utils/responsive.dart';
import 'package:microbiocol/widgets/custom_box.dart';

class UnlockPremium extends StatefulWidget {
  final String role;
  final double monthlyPrice;
  final double annuallyPrice;
  final List<SubscriptionModel> packageDetails;

  const UnlockPremium({
    super.key,
    required this.role,
    required this.packageDetails,
    required this.monthlyPrice,
    required this.annuallyPrice,
  });

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _billCard(
                      billingMethod: widget.role,
                      billingPrice: widget.monthlyPrice,
                      billingStatus: "Billed Monthly",
                      responsive: responsive,
                      isHasSave: false,
                      isClick: 0,
                    ),
                    _billCard(
                      billingMethod: widget.role,
                      billingPrice: widget.annuallyPrice,
                      billingStatus: "Billed Annually",
                      responsive: responsive,
                      isHasSave: true,
                      isClick: 1,
                    )
                  ],
                ),
                for (int i = 0; i < widget.packageDetails.length; i++)
                  _subscriptionDetails(i, widget.packageDetails[i])
              ],
            ),
          ],
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
      double discount = 4,
      required int isClick}) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _isTapped = isClick;
          },
        );
      },
      child: CustommBox(
        isHasBoxShadow: false,
        width: responsive == true ? 160 : 186,
        height: responsive == true ? 156 : 175,
        borderRadius: 8,
        color: _isTapped == isClick ? mprimaryColor : mwhiteColor,
        widget: Padding(
          padding: EdgeInsets.symmetric(
            vertical: responsive == true ? 10 : 15,
            horizontal: responsive == true ? 10 : 15,
          ),
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
                      ? CustommBox(
                          isHasBoxShadow: false,
                          width: 76,
                          height: 20,
                          borderRadius: 8,
                          color: maccentGreenColor,
                          widget: Center(
                            child: Text(
                              "SAVE ${discount.toStringAsFixed(0)}%",
                              style: const TextStyle(
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
  Widget _subscriptionDetails(int index, SubscriptionModel data) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 30 : 20),
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
            data.title,
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
