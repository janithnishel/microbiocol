import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';

ScaffoldFeatureController messageBar(BuildContext context, IconData icon,{double height=72, double fontsize=20}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      width: 520,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: CustommBox(
        width: 0,
        height: height,
        borderRadius: 8,
        color: mprimaryColor,
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: const Color(0xffFDFFFC), 
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Saved to General",
                style: TextStyle(
                  color: const Color(0xffFDFFFC),
                  fontSize: fontsize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                "Manage",
                style: TextStyle(
                  color: maccentGreenColor,
                  fontSize: fontsize,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 10,
                color: maccentGreenColor,
              )
            ],
          ),
        ),
        isHasBorder: false,
        isHasBoxShadow: false,
      ),
    ),
  );
}
