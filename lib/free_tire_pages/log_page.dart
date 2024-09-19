import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microbiocol/data/log_data.dart';
import 'package:microbiocol/models/log_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/tab_view.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  // fetch the log details

  final logDetails = LogData.logDataList;

  // store the clickable button index

  int _isTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                TabView(
                  leftSideTitle: "Stacks Log",
                  leftSideIcon: Icons.my_library_add_outlined,
                  righttSideTitle: "Counts Log",
                  rightSideimage: "assets/images/abacus.svg",
                  onTap: (a) {
                    setState(
                      () {
                        _isTap = a;
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                _isTap == 0
                    ? const Text("Stack log not found")
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: logDetails.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return _buildLogDeatails(
                                    logDetails[index], index);
                              },
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //create a single log

  Widget _buildLogDeatails(LogModel data, int index) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CustommBox(
                  width: 32,
                  height: 32,
                  borderRadius: 32,
                  color: maccentGreenColor,
                  widget: data.icon != null
                      ? Center(
                          child: Icon(
                            data.icon,
                            size: 16,
                            color: mprimaryColor,
                          ),
                        )
                      : Center(
                          child: SvgPicture.asset(
                            data.imageUrl!,
                            fit: BoxFit.cover,
                            width: 13,
                            height: 13,
                            color: mprimaryColor,
                          ),
                        ),
                  isHasBorder: true,
                  isHasBoxShadow: false,
                ),
                index != logDetails.length - 1
                    ? Container(
                        width: 1,
                        height: 32,
                        color: mprimaryColor,
                      )
                    : Container()
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                data.logTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: mprimaryColor,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 12.5),
              child: Text(
                data.time,
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: mprimaryColor,
                ),
              ),
            ),
          ],
        ),
        if (index == logDetails.length - 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    endIndent: 15,
                    color: mprimaryColor.withOpacity(0.25),
                    height: 1,
                    thickness: 1,
                  ),
                ),
                const Text(
                  "June 03, 2024",
                  style: TextStyle(
                    fontSize: 12,
                    color: mprimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 15,
                    color: mprimaryColor.withOpacity(0.25),
                    height: 1,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
