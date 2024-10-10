import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/free_tire_pages/submit_ticket.dart';
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
              if (ProfileDataList[index].title == "Support") {
                print("Support option clicked"); // Debugging line
                if (checkTire()) {
                  print("Free tier detected"); // Debugging line
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
                  print("Navigating to SubmitTicket"); // Debugging line
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SubmitTicket()),
                  );
                }
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