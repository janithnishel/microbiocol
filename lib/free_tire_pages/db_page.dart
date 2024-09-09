import 'package:flutter/material.dart';
import 'package:microbiocol/data/db_data.dart';
import 'package:microbiocol/models/db_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class DB extends StatefulWidget {
  const DB({super.key});

  @override
  State<DB> createState() => _DBState();
}

class _DBState extends State<DB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Search",
                keyBoardType: TextInputType.text,
                isHasSuffixIcon: true,
                suffixIcon: Icon(
                  Icons.search_sharp,
                  size: 20,
                ),
                suffixConstrainHeight: 20,
              ),
              ListView.builder(
                itemCount: DBData.dbDataList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final data = DBData.dbDataList[index];
                  return _MicroAnimalDetailCard(data);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _MicroAnimalDetailCard(DbModel data) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                data.imageUrl,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: CustommBox(
              isHasBoxShadow: false,
              width: 0,
              height: 165,
              borderRadius: 0,
              color: Colors.transparent,
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      data.type,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: mprimaryColor,
                      ),
                    ),
                    Text(
                      data.animalName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: mprimaryColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "${data.description}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: mtextColor,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    CustomButton(
                      isHasWidget: false,
                      isHasBorder: false,
                      title: "Save",
                      width: 50,
                    )
                  ],
                ),
              ),
              isHasBorder: false,
            ),
          ),
        ],
      ),
    );
  }
}
