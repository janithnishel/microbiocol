import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:microbiocol/desktop/desktop_login.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final cameras = await availableCameras();
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
      home: DesktopLogin(),
    );
  }
}
