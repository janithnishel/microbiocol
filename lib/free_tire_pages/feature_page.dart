import 'package:flutter/material.dart';
import 'package:microbiocol/free_tire_pages/review_page.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Feature extends StatelessWidget {
  const Feature({super.key});

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
                    TitleBar(context, title: "Suggest a Feature"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomForm(
                      noOfField: 3,
                      hintText: ["Your Name", "Email", "Feature"],
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
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Review(),
                          ),
                        );
                      },
                      child: CustomButton(
                        isHasWidget: false,
                        isHasBorder: true,
                        title: "Give a Review",
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
