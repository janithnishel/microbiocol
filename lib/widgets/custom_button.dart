import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final bool isHasWidget;
  final bool isHasBorder;
  final Widget? widget;
  final String? title;
  final double? fontSize;
  final double? borderWidth;
  final double? borderRadius;

  const CustomButton({
    super.key,
    this.width,
    this.color,
    this.textColor,
    this.title,
    this.widget,
    required this.isHasWidget,
    required this.isHasBorder,
    this.height = 36,
    this.fontSize = 16,
    this.borderWidth = 1,
    this.borderRadius=8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        color: color ?? mprimaryColor,
        border: isHasBorder
            ? Border.all(
                width: borderWidth!,
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
                  fontSize: fontSize,
                  color: textColor ?? mwhiteColor,
                ),
              ),
            ),
    );
  }
}
