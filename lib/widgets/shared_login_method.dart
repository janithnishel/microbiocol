import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';

Widget loginMethod() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      for (int a = 0; a < 3; a++)
        Expanded(
          flex: 1,
          child: Padding(
            padding: a == 0
                ? const EdgeInsets.only(right: 8)
                : a == 2
                    ? const EdgeInsets.only(left: 8)
                    : const EdgeInsets.only(left: 4, right: 4),
            child: CustomButton(
              isHasWidget: true,
              color: mwhiteColor,
              isHasBorder: true,
              widget: Center(
                child: a == 0
                    ? SvgPicture.asset(
                        "assets/images/google.svg",
                        fit: BoxFit.cover,
                        height: 16,
                        width: 16,
                      )
                    : a == 1
                        ? const Icon(
                            FontAwesomeIcons.facebook,
                            color: Color(0xff0F6AEF),
                            size: 16,
                          )
                        : const Icon(
                            FontAwesomeIcons.squareXTwitter,
                            size: 16,
                          ),
              ),
            ),
          ),
        ),
    ],
  );
}
