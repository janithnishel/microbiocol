import 'package:flutter/material.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/models/profile_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Account extends StatefulWidget {
  Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              TitleBar(context),
              const SizedBox(height: 20),
              Row(
                children: [
                  CustommBox(
                    isHasBoxShadow: false,
                    width: 100,
                    height: 100,
                    borderRadius: 100,
                    color: Colors.transparent,
                    widget: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    isHasBorder: false,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Jhon Doe",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mprimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      CustommBox(
                        isHasBoxShadow: false,
                        width: 80,
                        height: 24,
                        borderRadius: 8,
                        color: maccentGreenColor,
                        widget: Center(
                          child: Text(
                            "Free Tire",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: mprimaryColor,
                            ),
                          ),
                        ),
                        isHasBorder: false,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ListView.builder(
                itemCount: ProfileData.ProfileDataList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  ProfileModel data = ProfileData.ProfileDataList[index];

                  return _profileSelections(data);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomButton(
                isHasWidget: false,
                isHasBorder: false,
                color: mprimaryColor,
                title: "Log Out",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomButton(
                isHasWidget: false,
                isHasBorder: true,
                color: mwhiteColor,
                title: "Delete Account",
                textColor: mprimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  //create a single row of profile silection
  Widget _profileSelections(ProfileModel data) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustommBox(
            isHasBoxShadow: false,
            width: 40,
            height: 40,
            borderRadius: 8,
            color: Color(0xff1C1D33).withOpacity(0.4),
            widget: Center(
              child: Icon(
                data.icon,
                size: 20,
                color: mprimaryColor,
              ),
            ),
            isHasBorder: false,
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 228,
            child: Text(
              data.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: mBlack,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_right_sharp,
            size: 20,
            color: mprimaryColor,
          )
        ],
      ),
    );
  }
}
