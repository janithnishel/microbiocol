import 'package:flutter/material.dart';
import 'package:microbiocol/free_tire_pages/analyze_page.dart';
import 'package:microbiocol/utils/colors.dart';

class TabView extends StatefulWidget {
  final String leftSideTitle;
  final IconData leftSideIcon;
  final String RighttSideTitle;
  final String RightSideimage;

  const TabView({
    super.key,
    required this.leftSideTitle,
    required this.leftSideIcon,
    required this.RighttSideTitle,
    required this.RightSideimage,
  });

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int _isTap = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                _isTap = 0;
              });
              Analyze(
                index: 0,
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: _isTap == 0
                      ? const BorderSide(width: 2, color: mprimaryColor)
                      : BorderSide.none,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.leftSideIcon,
                    size: 20,
                    color: _isTap == 0
                        ? mprimaryColor
                        : mprimaryColor.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 6,
                  ),       
                  Text(
                    widget.leftSideTitle,
                    style: TextStyle(
                      fontSize:22,
                      fontWeight: FontWeight.w500,
                      color: _isTap == 0
                          ? mprimaryColor
                          : mprimaryColor.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                _isTap = 1;
              });

              Analyze(
                index: _isTap,
              );
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: _isTap == 1
                      ? const BorderSide(
                          width: 2,
                          color: mprimaryColor,
                        )
                      : BorderSide.none,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.RightSideimage,
                    fit: BoxFit.cover,
                    width: 18,
                    height: 18,
                    color: _isTap == 1
                        ? mprimaryColor
                        : mprimaryColor.withOpacity(0.5),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.RighttSideTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: _isTap == 1
                          ? mprimaryColor
                          : mprimaryColor.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        // Text("",style: TextStyle(fontSize: ,fontWeight: ,color: ),)
      ],
    );
  }
}
