import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:microbiocol/api_services/apiservice.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_txetfiled.dart';
import 'package:microbiocol/global.dart' as globals;

class DB extends StatefulWidget {
  const DB({super.key});

  @override
  State<DB> createState() => _DBState();
}

class _DBState extends State<DB> {
  // tracking the tier
  bool isFreeTier = checkTire();

  // tracking the button clicked state
  int _onTap = 99;

  // Store fetched predictions
  List<Map<String, dynamic>> userPredictions = [];

  bool _isLoading = true; // Loading state
  bool _hasError = false; // Error state

  @override
  void initState() {
    super.initState();
    fetchUserPredictions(); // Fetch user predictions when the widget is created
  }

  // Fetch predictions from the API
  Future<void> fetchUserPredictions() async {
    final userId = globals.userId; // Assuming userId is stored in globals

    if (userId != null) {
      final predictions = await ApiService.fetchUserPredictions(userId);

      if (predictions != null) {
        print('API Response: $predictions'); // Debugging: print the full API response
        setState(() {
          userPredictions = predictions; // Save the fetched data
          _isLoading = false; // Set loading to false
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      print("Error: userId is null");
    }
  }

  // Helper method to limit the description to 20 words
  String getShortDescription(String description) {
    if (description.isEmpty) return 'No description available';
    List<String> words = description.split(' ');
    if (words.length > 20) {
      return words.take(20).join(' ') + '...';
    } else {
      return description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loading indicator
          : _hasError
              ? const Center(child: Text("Failed to load data.")) // Show error message
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        const CustomTextField(
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
                          itemCount: userPredictions.length, // Based on API data
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final data = userPredictions[index];

                            print('Prediction at index $index: $data'); // Debugging: Print individual data

                            final imageUrl = data['image_url'] ?? 'assets/images/default.png';
                            final description = getShortDescription(data['about'] ?? '');
                            final title = data['predicted_class'] ?? 'No Title';

                            return _buildMicroAnimalDetailCard(
                              imageUrl: imageUrl,
                              description: description,
                              title: title,
                              index: index,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  // Modified method to build animal detail card
  Widget _buildMicroAnimalDetailCard({
    required String imageUrl,
    required String description,
    required String title,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/default.png',
                    height: 150,
                    fit: BoxFit.cover,
                  );
                },
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
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: mprimaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
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
                              setState(() {
                                _onTap = index;
                              });
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
                              setState(() {
                                _onTap = index;
                              });
                            },
                            child: CustomButton(
                              isHasWidget: false,
                              isHasBorder: false,
                              title: _onTap == index ? "Saved" : "Save",
                              width: _onTap == index ? 58 : 50,
                              color: _onTap == index ? maccentBlueColor : null,
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