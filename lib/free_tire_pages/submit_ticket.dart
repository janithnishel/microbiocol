import 'package:flutter/material.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/free_tire_pages/feature_page.dart';
import 'package:microbiocol/free_tire_pages/review_page.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/utils/responsive.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/custom_form.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class SubmitTicket extends StatelessWidget {
  SubmitTicket({super.key});

  //check the tier
  bool isFreeTier = checkTire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: Responsive.smailHeight(context) == false
          ? SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        titleBar(context,
                            title: isFreeTier
                                ? "Submit a Ticket"
                                : "Priority Ticket"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomForm(
                          noOfField: 4,
                          hintText: const [
                            "Your Name",
                            "Email",
                            "Subject",
                            "Issue Description",
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Attachments \n(optional)",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: mprimaryColor,
                              ),
                            ),
                            CustommBox(
                              isHasBoxShadow: false,
                              width: 184,
                              height: 36,
                              borderRadius: 8,
                              color: mwhiteColor,
                              widget: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_upload_outlined,
                                    color: mprimaryColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Choose from gallery",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: mprimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              isHasBorder: true,
                            ),
                            CustommBox(
                              isHasBoxShadow: false,
                              width: 32,
                              height: 36,
                              borderRadius: 8,
                              color: mwhiteColor,
                              widget: Center(
                                child: Icon(
                                  Icons.cloud_upload_outlined,
                                  color: mprimaryColor,
                                  size: 15,
                                ),
                              ),
                              isHasBorder: true,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomButton(
                          isHasWidget: false,
                          isHasBorder: false,
                          title: "Raise Ticket",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                        const SizedBox(
                          height: 15,
                        ),
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
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          titleBar(context,
                              title: isFreeTier
                                  ? "Submit a Ticket"
                                  : "Priority Ticket"),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomForm(
                            noOfField: 4,
                            hintText: const [
                              "Your Name",
                              "Email",
                              "Subject",
                              "Issue Description",
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Attachments \n(optional)",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: mprimaryColor,
                                ),
                              ),
                              CustommBox(
                                isHasBoxShadow: false,
                                width: 184,
                                height: 36,
                                borderRadius: 8,
                                color: mwhiteColor,
                                widget: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.file_upload_outlined,
                                      color: mprimaryColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Choose from gallery",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: mprimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                isHasBorder: true,
                              ),
                              CustommBox(
                                isHasBoxShadow: false,
                                width: 32,
                                height: 36,
                                borderRadius: 8,
                                color: mwhiteColor,
                                widget: Center(
                                  child: Icon(
                                    Icons.cloud_upload_outlined,
                                    color: mprimaryColor,
                                    size: 15,
                                  ),
                                ),
                                isHasBorder: true,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const CustomButton(
                            isHasWidget: false,
                            isHasBorder: false,
                            title: "Raise Ticket",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                          const SizedBox(
                            height: 15,
                          ),
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
            ),
    );
  }
}
