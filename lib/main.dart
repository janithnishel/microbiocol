import 'package:flutter/material.dart';
import 'package:microbiocol/free_tire_pages/analyze_page.dart';
import 'package:microbiocol/free_tire_pages/details_page.dart';
import 'package:microbiocol/free_tire_pages/feature_page.dart';
import 'package:microbiocol/free_tire_pages/unlock_Premium.dart';
import 'package:microbiocol/login_register_pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Lato",
            ),
      ),
      home:  SplashScreen(),
    );
  }
}
