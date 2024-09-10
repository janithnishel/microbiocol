import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/login_register_pages/forgot_password.dart';
import 'package:microbiocol/login_register_pages/register_page.dart';
import 'package:microbiocol/micro_bio.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';
import 'package:microbiocol/widgets/shared_login_method.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShow = true;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: mprimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    child: Column(
                      children: [
                        const CustomTextField(
                          hintText: "Email",
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          hintText: "Password",
                          isObscureText: isShow,
                          isHasSuffixIcon: true,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  isShow = !isShow;
                                },
                              );
                            },
                            child: isShow
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MicroBio(),
                        ),
                      );
                    },
                    child: const CustomButton(
                      isHasWidget: false,
                      title: "Login",
                      isHasBorder: false,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        color: mprimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  loginMethod(),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  );
                },
                child: const CustomButton(
                  isHasWidget: false,
                  isHasBorder: true,
                  title: "Register",
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
