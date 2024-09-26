import 'package:flutter/material.dart';
import 'package:microbiocol/desktop/desktop_login.dart';
import 'package:microbiocol/login_register_pages/login_page.dart';
import 'package:microbiocol/login_register_pages/register_page.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3,
            vertical: MediaQuery.of(context).size.height * 0.2,
          ),
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
                      fontSize: 24,
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
                        MaterialPageRoute(
                          builder: (context) => const DesktopLogin(),
                        ),
                      );
                    },
                    child: const CustomButton(
                      isHasWidget: false,
                      title: "Login",
                      isHasBorder: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      title: "Register",
                      isHasBorder: false,
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
