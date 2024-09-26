import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/login_register_pages/forgot_password.dart';
import 'package:microbiocol/login_register_pages/register_page.dart';
import 'package:microbiocol/micro_bio.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';
import 'package:microbiocol/widgets/shared_login_method.dart';

class DesktopLogin extends StatefulWidget {
  const DesktopLogin({super.key});

  @override
  State<DesktopLogin> createState() => _DesktopLoginState();
}

class _DesktopLoginState extends State<DesktopLogin> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3,
            vertical: MediaQuery.of(context).size.height * 0.15,
          ),
          child: CustommBox(
            width: 645,
            height: 876,
            borderRadius: 16,
            color: mwhiteColor,
            isHasBorder: false,
            isHasBoxShadow: true,
            blurRadius: 50,
            y: 17,
            boxShadowColor: mprimaryColor.withOpacity(0.2),
            widget: Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 25, right: 25, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              "assets/images/splashLogo.png",
                              fit: BoxFit.cover,
                              height: 80,
                              width: 160,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                          const SizedBox(height: 25),
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
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 10),
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
                            height: 30,
                          ),
                          loginMethod(),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
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
                    child: Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const CustomButton(
                          isHasWidget: false,
                          isHasBorder: true,
                          title: "Register",
                          color: mwhiteColor,
                          textColor: mprimaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
