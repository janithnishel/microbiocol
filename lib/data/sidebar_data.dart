import 'package:flutter/material.dart';
import 'package:microbiocol/models/sidebar_model.dart';

class SidebarData {
  final List<SidebarModel> sidebarHomeDataList = [
    SidebarModel(icon: Icons.home_outlined, labal: "Home", null),
    SidebarModel(icon: Icons.search_sharp, labal: "Search", null),
    SidebarModel(icon: Icons.trending_up_sharp, labal: "Log", null),
    SidebarModel(icon: Icons.folder_outlined, labal: "Folders", null),
    SidebarModel(icon: null, labal: "Stacks", "assets/images/layer-group.svg"),
    SidebarModel(icon: Icons.science_outlined, labal: "Lab", null),
    SidebarModel(icon: Icons.info_outline, labal: "Support", null),
    SidebarModel(icon: Icons.person_outline_rounded, labal: "Account", null),
  ];

  static final List<SidebarModel> sidebarReadDataList = [
    SidebarModel(icon: null, labal: "Reads", "assets/images/book-open.svg"),
    SidebarModel(icon: Icons.camera_alt_outlined, labal: "Rapid ID", null),
    SidebarModel(icon: null, labal: "Counts", "assets/images/abacus.svg"),
    SidebarModel(icon: Icons.trending_up_sharp, labal: "Trends", null),
    SidebarModel(icon: Icons.search_sharp, labal: "Search DB", null),
    SidebarModel(icon: null, labal: "Vendors", "assets/images/bag.svg"),
    SidebarModel(icon: Icons.info_outline, labal: "Support", null),
    SidebarModel(icon: Icons.person_outline_rounded, labal: "Account", null),
  ];
}
