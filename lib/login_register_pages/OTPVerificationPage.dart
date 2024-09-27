import 'package:flutter/material.dart';
import 'package:microbiocol/login_register_pages/NewPasswordPage.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';


class OTPVerificationPage extends StatefulWidget {
  final String email; // Pass the email to the OTP page

  const OTPVerificationPage({required this.email, super.key});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final _otpController = TextEditingController();

  // Method to verify OTP and navigate to reset password page
  void verifyOTP() {
    final otp = _otpController.text.trim();
    if (otp.isNotEmpty) {
      // Here, verify the OTP with your API, and on success, navigate to the new password screen.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewPasswordPage(email: widget.email),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the OTP.')),
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
                    "Verify OTP",
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
                "Enter the OTP sent to your email",
                style: TextStyle(
                  color: mprimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                hintText: "OTP",
                controller: _otpController,
                keyBoardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: verifyOTP, // Verify OTP and navigate to the new password page
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