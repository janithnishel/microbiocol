import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 12,
                      color: mprimaryColor,
                    ),
                  ),
                  const Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: mprimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Enter your email to reset your password",
                style: TextStyle(
                  color: mprimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 50),
              const CustomTextField(
                hintText: "Email",
                keyBoardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              const CustomButton(
                isHasWidget: false,
                isHasBorder: false,
                title: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}
