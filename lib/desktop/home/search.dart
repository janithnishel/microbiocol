import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/data/db_data.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/models/db_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
// tracking the tier
  bool isFreeTier = checkTire();

// tracking the buttton is clicked
  int _onTap = 99;

//track the clicked viewoption
  int _clickedViewOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 520,
                  child: CustomTextField(
                    hintText: "Search",
                    keyBoardType: TextInputType.text,
                    isHasSuffixIcon: true,
                    hintTextFontSize: 24,
                    textFontSize: 24,
                    verticalContentPadding: 12,
                    hintTextColor: mprimaryColor,
                    horizontalContentPadding: 15,
                    suffixConstrainHeight: 22,
                    boxConstraintsWidth: 60,
                    suffixIcon: Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.search,
                      size: 22,
                      color: mprimaryColor,
                    ),
                  ),
                ),
                const Spacer(),
                for (int i = 0; i < 2; i++)
             
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _clickedViewOption = i;
                      });
                    },
                    
                    child: Padding(
                      padding:  EdgeInsets.only(right: i==0?8:0,left: i==0?0:8),
                      child: CustomButton(
                        isHasWidget: true,
                        isHasBorder: true,
                        borderRadius: 8,
                        color:
                            _clickedViewOption == i ? mprimaryColor : mwhiteColor,
                        borderWidth: 1,
                        height: 36,
                        width: 73,
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              i == 0
                                  ? Icons.grid_view_outlined
                                  : Icons.format_list_bulleted_sharp,
                              size: 18,
                              color: _clickedViewOption == i
                                  ? mwhiteColor
                                  : mprimaryColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              i == 0 ? "Grid" : "List",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: _clickedViewOption == i
                                    ? mwhiteColor
                                    : mprimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            _clickedViewOption == 0
                ? GridView.builder(
                    itemCount: DBData.dbDataList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 355,
                      mainAxisSpacing: 15
                    ),
                    itemBuilder: (context, index) {
                      final data = DBData.dbDataList[index];
                      return _buildMicroAnimalDetailCard(data, index);
                    },
                  )
                : ListView.builder(
                    itemCount: DBData.dbDataList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final data = DBData.dbDataList[index];
                      return _buildMicroAnimalDetailCard(data, index);
                    },
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildMicroAnimalDetailCard(DbModel data, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: _clickedViewOption == 0
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    data.imageUrl,
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustommBox(
                  isHasBoxShadow: false,
                  width: 248,
                  height: 170,
                  borderRadius: 0,
                  color: Colors.transparent,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data.type,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: mprimaryColor,
                            height: 1),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.animalName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: mprimaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        overflow: TextOverflow.ellipsis,
                         data.description,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: mtextColor,
                        ),
                        maxLines: 4,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 8),
                      isFreeTier
                          ? GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    _onTap = index;
                                  },
                                );
                              },
                              child: const CustomButton(
                                isHasWidget: false,
                                isHasBorder: false,
                                title: "Save",
                                width: 50,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    _onTap = index;
                                  },
                                );
                              },
                              child: CustomButton(
                                isHasWidget: false,
                                isHasBorder: false,
                                title: _onTap == index ? "Saved" : "Save",
                                width: _onTap == index ? 58 : 50,
                                color:
                                    _onTap == index ? maccentBlueColor : null,
                              ),
                            ),
                    ],
                  ),
                  isHasBorder: false,
                ),
              ],
            )
          : Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    data.imageUrl,
                    height: 150,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustommBox(
                    isHasBoxShadow: false,
                    width: 0,
                    height: 150,
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
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: mprimaryColor,
                                height: 1),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data.animalName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: mprimaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            data.description,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: mtextColor,
                            ),
                            maxLines: 3,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 8),
                          isFreeTier
                              ? GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        _onTap = index;
                                      },
                                    );
                                  },
                                  child: const CustomButton(
                                    isHasWidget: false,
                                    isHasBorder: false,
                                    title: "Save",
                                    width: 50,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        _onTap = index;
                                      },
                                    );
                                  },
                                  child: CustomButton(
                                    isHasWidget: false,
                                    isHasBorder: false,
                                    title: _onTap == index ? "Saved" : "Save",
                                    width: _onTap == index ? 58 : 50,
                                    color: _onTap == index
                                        ? maccentBlueColor
                                        : null,
                                  ),
                                ),
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
