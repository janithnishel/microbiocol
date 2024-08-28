import 'package:flutter/material.dart';

class Responsive {
  static bool smailHeight(BuildContext context) {
    final bool value = MediaQuery.of(context).size.height<= 700 ? true : false;

    return value;
  }
}
