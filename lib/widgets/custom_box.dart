import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class CustommBox extends StatelessWidget {
  final Color color;
  final Widget widget;
  final double width;
  final double height;
  final double borderRadius;
  final bool isHasBorder;
  const CustommBox({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.color,
    required this.widget,
    required this.isHasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          border:
              isHasBorder ? Border.all(width: 2, color: mwhiteColor) : null),
      child: widget,
    );
  }
}
