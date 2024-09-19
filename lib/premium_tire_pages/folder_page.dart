import 'package:flutter/material.dart';
import 'package:microbiocol/data/folder_data.dart';
import 'package:microbiocol/models/folder_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/tile.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Folder extends StatelessWidget {
  Folder({super.key});

  //fetch the folder data

  final folderData = FolderData().folderDataList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    titleBar(context, title: "Folders"),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        itemCount: folderData.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          FolderModel data = folderData[index];
                          //This method includes details on the single row of the list view
                          return tile(
                            data,
                            false,
                            horizontal: 0,
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
