import 'package:flutter/material.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/free_tire_pages/feature_page.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Review extends StatelessWidget {
  Review({super.key});

  // tracking tier
  bool isFreeTier = checkTire();

  // Add controllers for the text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

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
                  const SizedBox(
                    height: 10,
                  ),
                  CustomForm(
                    noOfField: 3,
                    hintText: const ["Your Name", "Email", "Review"],
                    controllers: [
                      nameController, // Ensure these match the fields
                      emailController,
                      reviewController,
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Give Us a Start Rate",
                        style: TextStyle(
                          color: mprimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star_border,
                                size: 25,
                                color: mprimaryColor,
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomButton(
                    isHasWidget: false,
                    isHasBorder: false,
                    title: "Submit",
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
}