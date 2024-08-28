import 'package:flutter/material.dart';

class DB extends StatefulWidget {
  const DB({super.key});

  @override
  State<DB> createState() => _DBState();
}

class _DBState extends State<DB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Center(child: Text("This is a DB Page"))],
      ),
    );
  }
}
