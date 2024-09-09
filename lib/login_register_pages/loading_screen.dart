import 'package:flutter/material.dart';
import 'package:microbiocol/login_register_pages/login_page.dart';
import 'package:microbiocol/login_register_pages/register_page.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/splashLogo.png",
                        fit: BoxFit.cover,
                        height: 160,
                        width: 160,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login or Create a Account",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: mprimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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

            
            ],
          ),
        ),
      ),
    );
  }
}
