import 'dart:io';

import 'package:flutter/material.dart';
import 'package:microbiocol/app_route/manage_route.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(1160, 775));
    WindowManager.instance.setMaximumSize(const Size(2000, 2000));
    // runApp(const MyApp());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Lato",
            ),
      ),
      routerConfig: ManageRoute().route,
    );
  }
}
