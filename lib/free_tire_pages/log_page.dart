import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Center(child: Text("This is a Log Page"))],
      ),
    );
  }
}
