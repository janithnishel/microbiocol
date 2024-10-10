import 'package:flutter/material.dart';
import 'package:microbiocol/data/premium_profile_data.dart';
import 'package:microbiocol/data/profile_data.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart'; // Ensure this is the correct path
import 'package:microbiocol/global.dart' as globals; // Import globals
import 'package:microbiocol/models/premium_profile_model.dart';
import 'package:microbiocol/models/profile_model.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class Account extends StatefulWidget {
  const Account({
    super.key,
  });

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // tracking the free tier or premium
  bool isFreeTier = checkTire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              titleBar(context),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Fetching user's name from globals
                      Text(
                        globals.firstName ?? "John Doe",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: mprimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      CustommBox(
                        isHasBoxShadow: false,
                        width: isFreeTier ? 80 : 110,
                        height: 24,
                        borderRadius: 8,
                        color: maccentGreenColor,
                        widget: Center(
                          child: Text(
                            isFreeTier ? "Free Tier" : "Premium Tier",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: mprimaryColor,
                            ),
                          ),
                        ),
                        isHasBorder: false,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ListView.builder(
                itemCount: isFreeTier
                    ? ProfileData.ProfileDataList.length
                    : PremiumProfileData.premiumProfileDataList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Detect when "Support" is tapped and navigate to SubmitTicket
                      final title = isFreeTier
                          ? ProfileData.ProfileDataList[index].title
                          : PremiumProfileData.premiumProfileDataList[index].title;

                      if (title == "Support") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubmitTicket(),
                          ),
                        );
                      }
                    },
                    child: _buildProfileSelections(index),
                  );
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

  // Create a single row of profile selection
  Widget _buildProfileSelections(int index) {
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
            color: const Color(0xff1C1D33).withOpacity(0.4),
            widget: Center(
              child: Icon(
                isFreeTier
                    ? ProfileData.ProfileDataList[index].icon
                    : PremiumProfileData.premiumProfileDataList[index].icon,
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
              isFreeTier
                  ? ProfileData.ProfileDataList[index].title
                  : PremiumProfileData.premiumProfileDataList[index].title,
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