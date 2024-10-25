import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final TextInputType? keyBoardType;
  final Widget? suffixIcon;
  final bool? isHasSuffixIcon;
  final double? suffixConstrainHeight;
  final int? maxLines;
  final TextEditingController? controller;
  final double? hintTextFontSize;
  final double? textFontSize;
  final double? verticalContentPadding;
  final double? horizontalContentPadding;
  final Color? hintTextColor;
  final double? boxConstraintsWidth;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isObscureText,
    this.keyBoardType,
    this.suffixIcon,
    this.isHasSuffixIcon,
    this.suffixConstrainHeight,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.hintTextFontSize = 16,
    this.textFontSize = 16,
    this.verticalContentPadding = 6,
    this.hintTextColor,
    this.horizontalContentPadding = 10,
    this.boxConstraintsWidth = 35,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType ?? TextInputType.visiblePassword,
      obscureText: isObscureText ?? false,
      maxLines: maxLines,
      style: TextStyle(
        color: mprimaryColor,
        fontSize: textFontSize,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        suffixIcon: isHasSuffixIcon ?? false ? suffixIcon : null,
        suffixIconConstraints: BoxConstraints.tightFor(
          height: suffixConstrainHeight ?? 10,
          width: boxConstraintsWidth,
        ),
        fillColor: mTextFieldColor,
        filled: true,
        isDense: true,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: hintTextFontSize,
          fontWeight: FontWeight.w300,
          color: hintTextColor ?? mtextColor,
          fontStyle: FontStyle.italic,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalContentPadding!,
          horizontal: horizontalContentPadding!,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      validator: validator, // Add this line
    );
  }
}
