import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/api_services/apiservice.dart';
import 'package:microbiocol/login_register_pages/login_page.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/utils/responsive.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';
import 'package:microbiocol/widgets/shared_login_method.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isShowPassword = true;
  bool isShowConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Call the registerUser function from ApiService
        bool success = await ApiService.registerUser(
          email: _emailController.text,
          password: _passwordController.text,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
        );

        if (success) {
          // Navigate to the Login page upon successful registration
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        } else {
          // Handle registration error
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration failed. Please try again.')),
          );
        }
      } catch (e) {
        // Handle unexpected errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: mprimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: "First Name",
                            keyBoardType: TextInputType.name,
                            controller: _firstNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'First Name is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: "Last Name (optional)",
                            keyBoardType: TextInputType.name,
                            controller: _lastNameController,
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: "Email",
                            keyBoardType: TextInputType.emailAddress,
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || !value.contains('@')) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: "Password",
                            isObscureText: isShowPassword,
                            controller: _passwordController,
                            isHasSuffixIcon: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isShowPassword = !isShowPassword;
                                });
                              },
                              child: isShowPassword
                                  ? const Icon(
                                      FontAwesomeIcons.eye,
                                      size: 12,
                                      color: mprimaryColor,
                                    )
                                  : const Icon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 12,
                                      color: mprimaryColor,
                                    ),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            hintText: "Re-enter Password",
                            isObscureText: isShowConfirmPassword,
                            controller: _confirmPasswordController,
                            isHasSuffixIcon: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isShowConfirmPassword = !isShowConfirmPassword;
                                });
                              },
                              child: isShowConfirmPassword
                                  ? const Icon(
                                      FontAwesomeIcons.eye,
                                      color: mprimaryColor,
                                      size: 12,
                                    )
                                  : const Icon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 12,
                                      color: mprimaryColor,
                                    ),
                            ),
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: _registerUser,
                      child: const CustomButton(
                        isHasWidget: false,
                        isHasBorder: false,
                        title: "Register",
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Or Register with ",
                      style: TextStyle(
                        color: mprimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    loginMethod(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                child: const CustomButton(
                  isHasWidget: false,
                  isHasBorder: true,
                  title: "Login",
                  color: mwhiteColor,
                  textColor: mprimaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}