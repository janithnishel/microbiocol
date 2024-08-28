import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? isObscureText;
  final TextInputType? keyBoardType;
  final Widget? suffixIcon;  
  final bool? isHasSuffixIcon;         
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.isObscureText,
      this.keyBoardType, this.suffixIcon, this.isHasSuffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType ?? TextInputType.visiblePassword,
      obscureText: isObscureText ?? false,
    
      style: const TextStyle(
        color: mprimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
     
        suffixIcon:isHasSuffixIcon??false?suffixIcon: null,
        suffixIconConstraints: BoxConstraints.tightFor(height: 10,width:35),
        fillColor: mtextFieldColor,
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
