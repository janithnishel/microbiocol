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

  // Method to handle the email submission
  void submitEmail() {
    final email = _emailController.text.trim();
    if (email.isNotEmpty) {
      // Trigger the API request to send OTP here.
      // You can call your API to send OTP, and on success navigate to OTP verification screen.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPVerificationPage(email: email),
        ),
      );
    } else {
      // Show error if the email field is empty.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email.')),
      );
    }
  }

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
              CustomTextField(
                hintText: "Email",
                controller: _emailController,
                keyBoardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: submitEmail, // Call submitEmail method on button tap
                child: const CustomButton(
                  isHasWidget: false,
                  isHasBorder: false,
                  title: "Submit",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}