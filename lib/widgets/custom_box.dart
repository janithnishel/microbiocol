import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class CustommBox extends StatelessWidget {
  final Color color;
  final Widget widget;
  final double width;
  final double height;
  final double borderRadius;
  final bool isHasBorder;
  final bool isHasBoxShadow;
  final Color? borderColor;
  final double? borderWidth;
  const CustommBox({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.color,
    required this.widget,
    required this.isHasBorder,
    required this.isHasBoxShadow,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
        boxShadow: [
          isHasBoxShadow
              ? BoxShadow(
                  blurRadius: 16,
                  offset: const Offset(0, 5),
                  color: mBlack.withOpacity(0.15),
                )
              : const BoxShadow(
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  color: Colors.transparent,
                )
        ],
        border: isHasBorder
            ? Border.all(
                width: borderWidth ?? 1,
                color: borderColor ?? mprimaryColor,
              )
            : null,
      ),
      child: widget,
    );
  }
}
