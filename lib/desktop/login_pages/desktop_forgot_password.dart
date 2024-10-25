import 'package:flutter/material.dart';
import 'package:microbiocol/login_register_pages/OTPVerificationPage.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class DesktopForgotPassword extends StatefulWidget {
  const DesktopForgotPassword({super.key});

  @override
  State createState() => _DesktopForgotPasswordState();
}

class _DesktopForgotPasswordState extends State<DesktopForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Method to validate email format
  bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Method to handle the email submission
  void submitEmail() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email.')),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    // Trigger the API request to send OTP here.
    // Call your API to send OTP, and on success navigate to OTP verification screen.

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            OTPVerificationPage(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Center(
          child: CustommBox(
            width: 645,
            height: 404,
            borderRadius: 16,
            color: mwhiteColor,
            isHasBorder: false,
            isHasBoxShadow: true,
            blurRadius: 50,
            y: 17,
            boxShadowColor: mprimaryColor.withOpacity(0.2),
            widget: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 25,
                          color: mprimaryColor,
                        ),
                      ),
                      const SizedBox(width: 40),
                      const Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          fontSize: 48,
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
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextField(
                    hintText: "Email",
                    controller: _emailController,
                    keyBoardType: TextInputType.emailAddress,
                    isObscureText: false,
                    hintTextFontSize: 24,
                    textFontSize: 24,
                    verticalContentPadding: 12,
                    hintTextColor: mprimaryColor,
                    horizontalContentPadding: 15,
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: submitEmail,
                    child: const CustomButton(
                      isHasWidget: false,
                      isHasBorder: false,
                      title: "Submit",
                      height: 56,
                      fontSize: 24,
                      borderRadius: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
