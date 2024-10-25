import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:microbiocol/data/sidebar_data.dart';
import 'package:microbiocol/models/sidebar_model.dart';
import 'package:microbiocol/utils/colors.dart';

class ReadSideBar extends StatefulWidget {
  final StatefulNavigationShell readShell;

  const ReadSideBar({
    super.key,
    required this.readShell,
  });

  @override
  State<ReadSideBar> createState() => _ReadSideBarState();
}

class _ReadSideBarState extends State<ReadSideBar> {
  //fetch the sidebar deatils

  final sidebarReadData = SidebarData.sidebarReadDataList;

  //track the clicked button

  int _clickedIndex = 0;

  //create the pages list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            SizedBox(
              width: 384,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: sidebarReadData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      SidebarModel data = sidebarReadData[index];

                      return _buildSideBar(data, index);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child:
                    //Load proper page per click
                    widget.readShell)
          ],
        ),
      ),
    );
  }

  // build the single component of side bar

  Widget _buildSideBar(SidebarModel data, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.readShell.goBranch(index);

          _clickedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, right: 180),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              _clickedIndex == index ? maccentGreenColor : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              data.icon != null
                  ? Icon(
                      data.icon,
                      size: 50,
                      color: mprimaryColor,
                    )
                  : SvgPicture.asset(
                      data.imageurl!,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      // ignore: deprecated_member_use
                      color: mprimaryColor,
                    ),
              const SizedBox(
                width: 15,
              ),
              Text(
                data.labal,
                style: const TextStyle(
                  color: mprimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
