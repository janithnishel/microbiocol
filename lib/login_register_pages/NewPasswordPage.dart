import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class NewPasswordPage extends StatefulWidget {
  final String email;

  const NewPasswordPage({required this.email, super.key});

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Method to handle the password reset
  void resetPassword() {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields.')),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    // Call your API to update the password for the given email
    // After success, navigate to the login page or show a success message
    Navigator.pop(context); // Navigate back to the login or success page
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
                    "Reset Password",
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
                "Enter your new password",
                style: TextStyle(
                  color: mprimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                hintText: "New Password",
                controller: _newPasswordController,
                isObscureText: true,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                hintText: "Confirm Password",
                controller: _confirmPasswordController,
                isObscureText: true,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: resetPassword, // Handle password reset
                child: const CustomButton(
                  isHasWidget: false,
                  isHasBorder: false,
                  title: "Reset Password",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}