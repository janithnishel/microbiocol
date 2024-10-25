import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class Trend extends StatelessWidget {
  const Trend({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mwhiteColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 40,
                    color: mprimaryColor,
                  ),
                  Positioned(
                    left: 20,
                    top: 5,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: maccentGreenColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
