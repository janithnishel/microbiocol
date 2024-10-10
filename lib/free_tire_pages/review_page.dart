import 'package:flutter/material.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/free_tire_pages/feature_page.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';
import 'package:microbiocol/api_services/apiservice.dart';
import 'package:microbiocol/global.dart' as globals;

class Review extends StatefulWidget {
  Review({super.key});

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  // Define controllers for each field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  // Track user rating
  int rating = 0;

  // Check tier
  bool isFreeTier = checkTire();

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
                  titleBar(context, title: "Review"),
                  const SizedBox(height: 10),
                  CustomForm(
                    noOfField: 3,
                    controllers: [
                      nameController,
                      emailController,
                      reviewController,
                    ],
                    hintText: const ["Your Name", "Email", "Review"],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Give Us a Star Rating",
                        style: TextStyle(
                          color: mprimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(5, (index) {
                            return IconButton(
                              icon: Icon(
                                index < rating ? Icons.star : Icons.star_border,
                                color: mprimaryColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  rating = index + 1;
                                });
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    isHasWidget: false,
                    isHasBorder: false,
                    title: "Submit",
                    onTap: submitReview, // Function call to submit the review
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
                          builder: (context) => Feature(),
                        ),
                      );
                    },
                    child: const CustomButton(
                      isHasWidget: false,
                      isHasBorder: true,
                      title: "Suggest a Feature",
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

  // Function to submit the review
  Future<void> submitReview() async {
    final int? userId = globals.userId; // Retrieve userId from globals

    // Simple validation
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        reviewController.text.isEmpty ||
        rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and select a rating.')),
      );
      return;
    }

    // Basic email validation
    final email = emailController.text;
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    // Call the API to submit the review
    bool result = await ApiService.submitReview(
      userId: userId ?? 0,
      name: nameController.text,
      email: emailController.text,
      review: reviewController.text,
      rate: rating.toDouble(),
    );

    if (result) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted successfully!'), backgroundColor: Colors.green),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit review'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    reviewController.dispose();
    super.dispose();
  }
}