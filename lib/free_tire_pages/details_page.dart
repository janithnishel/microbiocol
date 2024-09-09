import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 12,
                    color: mprimaryColor,
                  ),
                  Icon(
                    Icons.share_outlined,
                    size: 20,
                    color: mprimaryColor,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/basillus.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Staphylococcus",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: mprimaryColor),
                          ),
                          Text(
                            "Basillus",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: mprimaryColor),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Staphylococcus is a genus of Gram-positive bacteria in the family Staphylococcaceae from the order Bacillales. Under the microscope, they appear spherical, and form in grape-like clusters. Staphylococcus species are facultative anaerobic organisms.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore...Read More.",
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 2; i++)
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: i == 0
                            ? EdgeInsets.only(right: 8)
                            : EdgeInsets.only(left: 8),
                        child: CustomButton(
                          isHasWidget: true,
                          isHasBorder: false,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              i == 0
                                  ? Image.asset(
                                      "assets/images/count.svg",
                                      fit: BoxFit.cover,
                                      width: 13,
                                      height: 13,
                                    )
                                  : const Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Icon(
                                        Icons.create_new_folder_outlined,
                                        color: Color(0xffFDFFFC),
                                        size: 15,
                                      ),
                                    ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                i == 0 ? "Count" : "Add to Folder",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(
                                    0xffFDFFFC,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
