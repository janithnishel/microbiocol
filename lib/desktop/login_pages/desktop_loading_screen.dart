import 'package:flutter/material.dart';
import 'package:microbiocol/desktop/login_pages/desktop_login.dart';
import 'package:microbiocol/desktop/login_pages/desktop_register.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';

class DesktopLoadingScreen extends StatelessWidget {
  const DesktopLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Center(
          child: CustommBox(
            width: 645,
            height: 504,
            borderRadius: 16,
            color: mwhiteColor,
            isHasBorder: false,
            isHasBoxShadow: true,
            blurRadius: 50,
            y: 17,
            boxShadowColor: mprimaryColor.withOpacity(0.2),
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/splashLogo.png",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 160,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Login or Create a Account",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                      color: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const DesktopLogin(),
                        ),
                      );
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
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const DesktopRegister(),
                        ),
                      );
                    },
                    child: const CustomButton(
                      isHasWidget: false,
                      title: "Register",
                      isHasBorder: false,
                      fontSize: 24,
                      height: 56,
                      borderRadius: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
