import 'package:flutter/material.dart';
import 'package:microbiocol/free_tire_pages/feature_page.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Review extends StatelessWidget {
  const Review({super.key});

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
              Container(
                child: Column(
                  children: [
                    TitleBar(context, title: "Review"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomForm(
                      noOfField: 3,
                      hintText: ["Your Name", "Email", "Review"],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
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
                                Icon(
                                  Icons.star_border,
                                  size: 25,
                                  color: mprimaryColor,
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      isHasWidget: false,
                      isHasBorder: false,
                      title: "Submit",
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
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
                        title: "Raise a Ticket",
                        color: mwhiteColor,
                        textColor: mprimaryColor,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Feature(),
                          ),
                        );
                      },
                      child: CustomButton(
                        isHasWidget: false,
                        isHasBorder: true,
                        title: "Suggest a Feature",
                        color: mwhiteColor,
                        textColor: mprimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
