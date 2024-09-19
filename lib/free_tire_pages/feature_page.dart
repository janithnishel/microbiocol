import 'package:flutter/material.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/free_tire_pages/review_page.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Feature extends StatelessWidget {
  Feature({super.key});

  //check tier

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
                  titleBar(context, title:"Suggest a Feature"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomForm(
                    noOfField: 3,
                    hintText: const ["Your Name", "Email", "Feature"],
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
                          builder: (context) =>  SubmitTicket(),
                        ),
                      );
                    },
                    child:  CustomButton(
                      isHasWidget: false,
                      isHasBorder: true,
                      title: isFreeTier? "Raise a Ticket":"Raise a Priority Ticket",
                      color: mwhiteColor,
                      textColor: mprimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
}
