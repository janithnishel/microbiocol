import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:microbiocol/desktop/login_pages/desktop_forgot_password.dart';
import 'package:microbiocol/desktop/login_pages/desktop_register.dart';
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
        child: Center(
          child: CustommBox(
            width: 645,
            height: 800,
            borderRadius: 16,
            color: mwhiteColor,
            isHasBorder: false,
            isHasBoxShadow: true,
            blurRadius: 50,
            y: 17,
            boxShadowColor: mprimaryColor.withOpacity(0.2),
            widget: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontSize: 48,
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
                                hintTextColor: mprimaryColor,
                                hintTextFontSize: 24,
                                horizontalContentPadding: 15,
                                verticalContentPadding: 12,
                                textFontSize: 24,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                hintText: "Password",
                                isObscureText: isShow,
                                isHasSuffixIcon: true,
                                hintTextColor: mprimaryColor,
                                hintTextFontSize: 24,
                                horizontalContentPadding: 15,
                                verticalContentPadding: 12,
                                textFontSize: 24,
                                suffixConstrainHeight: 14,
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
                                          size: 15,
                                          color: mprimaryColor,
                                        )
                                      : const Icon(
                                          FontAwesomeIcons.eyeSlash,
                                          size: 15,
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
                            GoRouter.of(context).go("/read");
                          },
                          child: const CustomButton(
                            isHasWidget: false,
                            title: "Login",
                            isHasBorder: false,
                            fontSize: 24,
                            height: 56,
                            borderRadius: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const DesktopForgotPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: mprimaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          color: mprimaryColor,
                          width: 192,
                          height: 1.5,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        loginMethod(
                          height: 56,
                          borderWidth: 2,
                          iconsize: 25,
                          borderRadius: 16,
                          padding: 48,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DesktopRegister(),
                          ),
                        );
                      },
                      child: const CustomButton(
                        isHasWidget: false,
                        isHasBorder: true,
                        title: "Register",
                        color: mwhiteColor,
                        textColor: mprimaryColor,
                        fontSize: 24,
                        height: 56,
                        borderWidth: 2,
                        borderRadius: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
