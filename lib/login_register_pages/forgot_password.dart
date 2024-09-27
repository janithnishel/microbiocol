import 'package:flutter/material.dart';
import 'package:microbiocol/login_register_pages/OTPVerificationPage.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Method to validate email format
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
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
      MaterialPageRoute(
        builder: (context) => OTPVerificationPage(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 20,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(width: 10),
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
              CustomTextField(
                hintText: "Email",
                controller: _emailController,
                keyBoardType: TextInputType.emailAddress,
                isObscureText: false,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: submitEmail,
                child: CustomButton(
                  isHasWidget: false,
                  isHasBorder: false,
                  title: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}