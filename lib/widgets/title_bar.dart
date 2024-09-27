import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

Widget titleBar(BuildContext context, {String title = ""}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Icon(
        Icons.arrow_back_ios_sharp,
        color: mprimaryColor,
        size: 15,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.875,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: mprimaryColor,
            ),
          ),
        ),
      ),
    ],
  );
}
