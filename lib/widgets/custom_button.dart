import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final Color? color;
  final Color? textColor;
  final String? title;
  final Widget? widget;
  final bool isHasWidget;
  final bool isHasBorder;

  const CustomButton({
    super.key,
    this.width,
    this.color,
    this.textColor,
    this.title,
    this.widget,
    required this.isHasWidget,
    required this.isHasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color ?? mprimaryColor,
        border: isHasBorder
            ? Border.all(
                width: 1,
                color: mprimaryColor,
              )
            : null,
      ),
      child: isHasWidget
          ? widget
          : Center(
              child: Text(
                title ?? "",
                style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: textColor ?? mwhiteColor,
                ),
              ),
            ),
    );
  }
}
