import 'package:flutter/material.dart';
import 'package:microbiocol/data/botttom_navigation_data.dart';
import 'package:microbiocol/free_tire_pages/account_page.dart';
import 'package:microbiocol/free_tire_pages/analyze_page.dart';
import 'package:microbiocol/free_tire_pages/db_page.dart';
import 'package:microbiocol/free_tire_pages/home_page.dart';
import 'package:microbiocol/free_tire_pages/log_page.dart';
import 'package:microbiocol/utils/colors.dart';

class MicroBio extends StatefulWidget {
  const MicroBio({super.key});

  @override
  State<MicroBio> createState() => _MicroBiiState();
}

class _MicroBiiState extends State<MicroBio> {
  // fetch the bottom navigation data from Bottom Navigation Class
  final navigationData = BottomNavigationData().bottomNavigationDataList;

  // tracking the taped button index no
  int _clickIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Analyze(),
    DB(),
    Log(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mprimaryColor,
        backgroundColor: Color(0xffFDFFFC),
        elevation: 0.5,
        currentIndex: _clickIndex,
        unselectedItemColor: mprimaryColor,
        onTap: (value) {
          setState(() {
            _clickIndex = value;
          });
        },
        items: [
          for (int i = 0; i < 5; i++)
            BottomNavigationBarItem(
              icon: Container(
                width: 55,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _clickIndex == i
                        ? maccentGreenColor.withOpacity(0.5)
                        : Colors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      navigationData[i].icon,
                      size: 30,
                    ),
                    Text(
                      navigationData[i].title,
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: mprimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              label: "",
            ),
        ],
      ),
      body: SafeArea(child: _pages[_clickIndex]),
    );
  }
}
