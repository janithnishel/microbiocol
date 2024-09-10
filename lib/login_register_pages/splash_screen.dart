import 'package:flutter/material.dart';
import 'package:microbiocol/login_register_pages/loading_screen.dart';
import 'package:microbiocol/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLoadingScreen();
  }

  _navigateToLoadingScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoadingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: Center(
        child: Image.asset(
          "assets/images/splashLogo.png",
          fit: BoxFit.cover,
          height: 320,
          width: 320,
        ),
      ),
    );
  }
}
