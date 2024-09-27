import 'package:flutter/material.dart';

class LogModel {
  final IconData? icon;
  final String logTitle;
  final String time;
  final String? imageUrl;

  LogModel({
    required this.icon,
    required this.logTitle,
    required this.time,
    required this.imageUrl,
  });
}
