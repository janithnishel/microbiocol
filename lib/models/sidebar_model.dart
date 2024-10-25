import 'package:flutter/material.dart';

class SidebarModel {
  final IconData? icon;
  final String labal;
  final String? imageurl;

  SidebarModel(
    this.imageurl, {
    this.icon,
    required this.labal,
  });
}
