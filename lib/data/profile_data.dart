import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
import 'package:microbiocol/free_tire_pages/unlock_premium.dart'; // Ensure correct import
import 'package:microbiocol/models/profile_model.dart';

// Boolean value changes according to the user's tier
bool isFreeTier = false;

// Tracking the user's tier
bool checkTire() {
  return isFreeTier;
}

class ProfileData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView.builder(
        itemCount: ProfileDataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(ProfileDataList[index].icon),
            title: Text(ProfileDataList[index].title),
            onTap: () {
              // Debugging log
              print('Tapped: ${ProfileDataList[index].title}');

              if (ProfileDataList[index].title == "Support") {
                if (checkTire()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Upgrade to Access Support"),
                        content: const Text(
                          "Support is only available for premium users. Please upgrade your account.",
                        ),
                        actions: [
                          TextButton(
                            child: const Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubmitTicket()),
                  );
                }
              }

              // Handle Subscription Settings
              else if (ProfileDataList[index].title == "Subscription Settings") {
                print("Navigating to UnlockPremium"); // Debugging line
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnlockPremium()),
                ).then((_) {
                  // Optional: add logic after returning from UnlockPremium if needed
                  print("Returned from UnlockPremium");
                });
              }
            },
          );
        },
      ),
    );
  }

  static List<ProfileModel> ProfileDataList = [
    ProfileModel(
      icon: FontAwesomeIcons.user,
      title: "Personal Information",
    ),
    ProfileModel(
      icon: FontAwesomeIcons.bell,
      title: "Notification Settings",
    ),
    ProfileModel(
      icon: Icons.account_balance_wallet_outlined,
      title: "Subscription Settings",
    ),
    ProfileModel(
      icon: Icons.cloud_upload_outlined,
      title: "User Backup",
    ),
    ProfileModel(
      icon: Icons.info_outline,
      title: "Support",
    ),
  ];
}