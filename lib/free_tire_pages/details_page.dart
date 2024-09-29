import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/lock_box.dart';
import 'package:microbiocol/utils/colors.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> data;
  final String imagePath;

  DetailsPage({required this.data, required this.imagePath});

  bool isFreeTire = checkTire();

  @override
  Widget build(BuildContext context) {
    final predictedClass = data['predicted_class'] ?? 'No Class Available';
    final confidence = (data['confidence'] * 100).toStringAsFixed(2) + '%';
    final about = data['about'] ?? 'No description available';
    final articles = data['articles'] as List<dynamic>? ?? [];
    final topics = data['key_research_topics'] as List<dynamic>? ?? [];
    final uses = data['uses'] ?? 'No uses available';
    final illnessesCaused = data['illnesses_caused'] ?? 'No information available';

    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp, size: 20, color: mprimaryColor),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Icon(Icons.share_outlined, size: 20, color: mprimaryColor)
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              predictedClass,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: mprimaryColor,
                              ),
                            ),
                            Text(
                              "Confidence: $confidence",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: mprimaryColor,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              about,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: mprimaryColor.withOpacity(0.8),
                              ),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 2; i++)
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: i == 0 ? const EdgeInsets.only(right: 8) : const EdgeInsets.only(left: 8),
                          child: CustomButton(
                            isHasWidget: true,
                            isHasBorder: false,
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                i == 0
                                    ? SvgPicture.asset(
                                        "assets/images/abacus.svg",
                                        fit: BoxFit.cover,
                                        color: mwhiteColor,
                                        width: 16,
                                        height: 16,
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Icon(
                                          Icons.create_new_folder_outlined,
                                          color: Color(0xffFDFFFC),
                                          size: 15,
                                        ),
                                      ),
                                const SizedBox(width: 10),
                                Text(
                                  i == 0 ? "Count" : "Add to Folder",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFDFFFC),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                CustommBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  borderRadius: 8,
                  color: mwhiteColor,
                  widget: Expanded(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Articles",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: mprimaryColor),
                            ),
                            const SizedBox(height: 13),
                            ...articles.map((article) => Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 1),
                                  child: Text(
                                    article['name'],
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: mprimaryColor),
                                  ),
                                )),
                            const SizedBox(height: 15),
                            const Text(
                              "Key Research Topics",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: mprimaryColor),
                            ),
                            const SizedBox(height: 13),
                            ...topics.map((topic) => Padding(
                                  padding: const EdgeInsets.only(left: 5, top: 1),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.circle, size: 6, color: mprimaryColor),
                                      const SizedBox(width: 5),
                                      Text(
                                        topic,
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: mprimaryColor),
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(height: 15),
                            const Text(
                              "Uses",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: mprimaryColor),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              uses,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: mprimaryColor),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Illnesses Caused",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: mprimaryColor),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              illnessesCaused,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: mprimaryColor),
                            ),
                          ],
                        ),
                        if (isFreeTire)
                          lockBox(context, isFreeTire, MediaQuery.of(context).size.height),
                      ],
                    ),
                  ),
                  isHasBorder: false,
                  isHasBoxShadow: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}