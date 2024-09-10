import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';

Widget lockBox(BuildContext context, bool isFreeTire, height) {
  return CustommBox(
    isHasBoxShadow: false,
    isHasBorder: false,
    width: MediaQuery.of(context).size.width,
    height: height,
    borderRadius: 8,
    color: mprimaryColor.withOpacity(0.9),
    widget: const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustommBox(
          isHasBoxShadow: false,
          isHasBorder: true,
          borderColor: mwhiteColor,
          borderWidth: 2,
          width: 40,
          height: 40,
          borderRadius: 40,
          color: Colors.transparent,
          widget: Icon(
            Icons.lock_outline_rounded,
            color: mwhiteColor,
            size: 20,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        CustommBox(
          isHasBoxShadow: false,
          isHasBorder: false,
          width: 133,
          height: 36,
          borderRadius: 7,
          color: mprimaryColor,
          widget: Center(
            child: Text(
              "Unlock Premium",
              style: TextStyle(
                color: mwhiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
