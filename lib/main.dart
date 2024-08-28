import 'package:flutter/material.dart';
import 'package:microbiocol/login_register_pages/splash_screen.dart';
import 'package:microbiocol/micro_bio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Lato"),
      home: SplashScreen(),
    );
  }
}
