import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/desktop/login_pages/desktop_login.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';
import 'package:microbiocol/widgets/shared_login_method.dart';

class DesktopRegister extends StatefulWidget {
  const DesktopRegister({super.key});

  @override
  State<DesktopRegister> createState() => _RegisterState();
}

class _RegisterState extends State<DesktopRegister> {
  bool isShowPasword = true;
  bool isShowConfirmpasword = true;
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
            widget: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
              ),
              child: SingleChildScrollView(
                child: Column(
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
                            "Register",
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
                                hintText: "First Name",
                                keyBoardType: TextInputType.name,
                                hintTextColor: mprimaryColor,
                                hintTextFontSize: 24,
                                textFontSize: 24,
                                horizontalContentPadding: 15,
                                verticalContentPadding: 12,
                              ),
                              const SizedBox(height: 20),
                              const CustomTextField(
                                hintText: "Last Name (optional)",
                                keyBoardType: TextInputType.name,
                                hintTextColor: mprimaryColor,
                                hintTextFontSize: 24,
                                textFontSize: 24,
                                horizontalContentPadding: 15,
                                verticalContentPadding: 12,
                              ),
                              const SizedBox(height: 20),
                              const CustomTextField(
                                hintText: "Email",
                                keyBoardType: TextInputType.emailAddress,
                                hintTextColor: mprimaryColor,
                                hintTextFontSize: 24,
                                textFontSize: 24,
                                horizontalContentPadding: 15,
                                verticalContentPadding: 12,
                              ),
                              const SizedBox(height: 20),
                              CustomTextField(
                                hintText: "Password",
                                isObscureText: isShowPasword,
                                isHasSuffixIcon: true,
                                hintTextColor: mprimaryColor,
                                hintTextFontSize: 24,
                                textFontSize: 24,
                                horizontalContentPadding: 15,
                                verticalContentPadding: 12,
                                suffixConstrainHeight: 14,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        isShowPasword = !isShowPasword;
                                      },
                                    );
                                  },
                                  child: isShowPasword
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
                              const SizedBox(height: 20),
                              CustomTextField(
                                hintText: "Re-enter Password",
                                isObscureText: isShowConfirmpasword,
                                isHasSuffixIcon: true,
                                hintTextColor: mprimaryColor,
                                hintTextFontSize: 24,
                                textFontSize: 24,
                                horizontalContentPadding: 15,
                                verticalContentPadding: 12,
                                suffixConstrainHeight: 14,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        isShowConfirmpasword =
                                            !isShowConfirmpasword;
                                      },
                                    );
                                  },
                                  child: isShowConfirmpasword
                                      ? const Icon(
                                          FontAwesomeIcons.eye,
                                          color: mprimaryColor,
                                          size: 15,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DesktopLogin(),
                              ),
                            );
                          },
                          child: const CustomButton(
                            isHasWidget: false,
                            isHasBorder: false,
                            title: "Register",
                            height: 56,
                            fontSize: 24,
                            borderRadius: 16,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "Or Register with ",
                          style: TextStyle(
                            color: mprimaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 50),
                        loginMethod(
                          height: 56,
                          borderWidth: 2,
                          iconsize: 25,
                          borderRadius: 16,
                          padding: 48,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DesktopLogin(),
                          ),
                        );
                      },
                      child: const CustomButton(
                        isHasWidget: false,
                        isHasBorder: true,
                        title: "Login",
                        color: mwhiteColor,
                        textColor: mprimaryColor,
                        borderWidth: 2,
                        borderRadius: 16,
                        height: 56,
                        fontSize: 24,
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
