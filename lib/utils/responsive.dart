import 'package:flutter/material.dart';

class Responsive {
  // check whether the mobile screen height
  static bool smailHeight(BuildContext context) {
    final bool value = MediaQuery.of(context).size.height <= 700 ? true : false;

    return value;
  }

  // check whether the mobile screen width
  static bool smallWidth(BuildContext context) {
    final bool value = MediaQuery.of(context).size.width <= 360 ? true : false;

    return value;
  }
}
