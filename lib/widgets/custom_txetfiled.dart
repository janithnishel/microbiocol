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
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isObscureText = false,
    this.keyBoardType,
    this.suffixIcon,
    this.isHasSuffixIcon = false,
    this.suffixConstrainHeight,
    this.maxLines = 1,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyBoardType ?? TextInputType.text,
      obscureText: isObscureText ?? false,
      maxLines: maxLines,
      style: const TextStyle(
        color: mprimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: isHasSuffixIcon ?? false ? suffixIcon : null,
        suffixIconConstraints: BoxConstraints.tightFor(
          height: suffixConstrainHeight ?? 10,
          width: 35,
        ),
        fillColor: mTextFieldColor,
        filled: true,
        isDense: true,
        hintMaxLines: 1,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: mtextColor,
          fontStyle: FontStyle.italic,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 10,
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
    );
  }
}