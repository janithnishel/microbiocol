import 'package:flutter/material.dart';
import 'package:microbiocol/api_services/apiservice.dart'; // Import the API service
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/free_tire_pages/review_page.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';
import 'package:microbiocol/global.dart' as globals; // Access global variables

class Feature extends StatefulWidget {
  Feature({super.key});

  @override
  _FeatureState createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  // Define controllers for each field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController featureController = TextEditingController();

  bool isLoading = false; // To show loading spinner when submitting

  // Check tier
  bool isFreeTier = checkTire();

  // Submit the feature suggestion
  Future<void> submitFeature() async {
    setState(() {
      isLoading = true; // Show loader
    });

    // Get the userId from globals
    int? userId = globals.userId;

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        featureController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      setState(() {
        isLoading = false; // Hide loader
      });
      return;
    }

    try {
      bool result = await ApiService.submitFeature(
        name: nameController.text,
        email: emailController.text,
        feature: featureController.text,
        userId: userId ?? 0, // Send userId from globals
      );

      setState(() {
        isLoading = false; // Hide loader
      });

      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Feature submitted successfully!')),
        );
      } else {
        throw Exception('Failed to submit feature');
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Hide loader
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit feature: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  titleBar(context, title: "Suggest a Feature"),
                  const SizedBox(height: 10),
                  CustomForm(
                    noOfField: 3,
                    controllers: [
                      nameController,
                      emailController,
                      featureController,
                    ],
                    hintText: const ["Your Name", "Email", "Feature"],
                  ),
                  const SizedBox(height: 30),
                  isLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          isHasWidget: false,
                          isHasBorder: false,
                          title: "Submit",
                          onTap: submitFeature, // Trigger feature submission
                        ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubmitTicket(),
                        ),
                      );
                    },
                    child: CustomButton(
                      isHasWidget: false,
                      isHasBorder: true,
                      title: isFreeTier
                          ? "Raise a Ticket"
                          : "Raise a Priority Ticket",
                      color: mwhiteColor,
                      textColor: mprimaryColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Review(),
                        ),
                      );
                    },
                    child: const CustomButton(
                      isHasWidget: false,
                      isHasBorder: true,
                      title: "Give a Review",
                      color: mwhiteColor,
                      textColor: mprimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    featureController.dispose();
    super.dispose();
  }
}