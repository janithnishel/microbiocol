import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';

Widget loginMethod({double height=36,double borderWidth =1,double iconsize =16,double borderRadius=8,double padding=8}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      for (int a = 0; a < 3; a++)
        Expanded(
          flex: 1,
          child: Padding(
            padding: a == 0
                ? EdgeInsets.only(right: padding)
                : a == 2
                    ?  EdgeInsets.only(left: padding)
                    :  EdgeInsets.only(left: padding/2, right: padding/2),
            child: CustomButton(
              isHasWidget: true,
              color: mwhiteColor,
              isHasBorder: true,
              height:height ,
              borderWidth: borderWidth,
              borderRadius: borderRadius,
              widget: Center(
                child: a == 0
                    ? SvgPicture.asset(
                        "assets/images/google.svg",
                        fit: BoxFit.cover,
                        height: iconsize,
                        width: iconsize,
                      )
                    : a == 1
                        ?  Icon(
                            FontAwesomeIcons.facebook,
                            color: const Color(0xff0F6AEF),
                            size: iconsize,
                          )
                        :  Icon(
                            FontAwesomeIcons.squareXTwitter,
                            size: iconsize,
                          ),
              ),
            ),
          ),
        ),
    ],
  );
}
