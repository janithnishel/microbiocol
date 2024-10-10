import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final Color? color;
  final Color? textColor;
  final String? title;
  final Widget? widget;
  final bool isHasBorder;
  final bool isLoading; // Add loading state
  final VoidCallback? onTap; // Add onTap for actions

  const CustomButton({
    super.key,
    this.width,
    this.color,
    this.textColor,
    this.title,
    this.widget,
    required this.isHasBorder,
    this.isLoading = false, // Default to false
    this.onTap, required bool isHasWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap, // Disable tap while loading
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: 36, // Fixed height for buttons
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isLoading ? Colors.grey : (color ?? mprimaryColor), // Show grey when loading
          border: isHasBorder
              ? Border.all(
                  width: 1,
                  color: mprimaryColor,
                )
              : null,
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2.0,
                )
              : (widget ??
                  Text(
                    title ?? "",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: textColor ?? mwhiteColor,
                    ),
                  )),
        ),
      ),
    );
  }
}