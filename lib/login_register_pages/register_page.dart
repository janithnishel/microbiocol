import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  bool isShowPasword = true;
  bool isShowConfirmpasword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mwhiteColor,
      body: Responsive.smailHeight(context) == false
          ? SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                            child: Column(
                              children: [
                                const CustomTextField(
                                  hintText: "First Name",
                                  keyBoardType: TextInputType.name,
                                ),
                                const SizedBox(height: 15),
                                const CustomTextField(
                                  hintText: "Last Name (optional)",
                                  keyBoardType: TextInputType.name,
                                ),
                                const SizedBox(height: 15),
                                const CustomTextField(
                                  hintText: "Email",
                                  keyBoardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 15),
                                CustomTextField(
                                  hintText: "Password",
                                  isObscureText: isShowPasword,
                                  isHasSuffixIcon: true,
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
                                const SizedBox(height: 15),
                                CustomTextField(
                                  hintText: "Re-enter Password",
                                  isObscureText: isShowConfirmpasword,
                                  isHasSuffixIcon: true,
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
                                            size: 12,
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
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
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
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                              child: Column(
                                children: [
                                  const CustomTextField(
                                    hintText: "First Name",
                                    keyBoardType: TextInputType.name,
                                  ),
                                  const SizedBox(height: 15),
                                  const CustomTextField(
                                    hintText: "Last Name (optional)",
                                    keyBoardType: TextInputType.name,
                                  ),
                                  const SizedBox(height: 15),
                                  const CustomTextField(
                                    hintText: "Email",
                                    keyBoardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextField(
                                    hintText: "Password",
                                    isObscureText: isShowPasword,
                                    isHasSuffixIcon: true,
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
                                  const SizedBox(height: 15),
                                  CustomTextField(
                                    hintText: "Re-enter Password",
                                    isObscureText: isShowConfirmpasword,
                                    isHasSuffixIcon: true,
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
                                              size: 12,
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
                                    builder: (context) => const Login(),
                                  ),
                                );
                              },
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
                      const SizedBox(
                        height: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                        child: const CustomButton(
                          isHasWidget: false,
                          isHasBorder: true,
                          title: "Login",
                          color: mwhiteColor,
                          textColor: mprimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
