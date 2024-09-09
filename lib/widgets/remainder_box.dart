import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';

   class  InfoBox {
  Widget freeIdentification() {
   return remainderBox(
        "Your remaining free identification count for this month is", 3);
  }

  Widget purchaseIdentification() {
   return remainderBox("Your remaining purchased identification count is", 14);
  }

  Widget remainderBox(String title, int count) {
    return CustommBox(
      isHasBoxShadow: true,
      width: 290,
      height: 225,
      borderRadius: 8,
      color: mwhiteColor,
      widget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: mprimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: maccentGreenColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  isHasWidget: false,
                  isHasBorder: true,
                  color: mwhiteColor,
                  textColor: mprimaryColor,
                  title: "Close",
                  width: 125,
                ),
                CustomButton(
                  isHasWidget: false,
                  isHasBorder: false,
                  color: mprimaryColor,
                  textColor: mwhiteColor,
                  title: "Get More",
                  width: 125,
                ),
              ],
            )
          ],
        ),
      ),
      isHasBorder: false,
    );
  }
}
