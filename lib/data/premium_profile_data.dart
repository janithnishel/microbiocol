import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/models/premium_profile_model.dart';

class PremiumProfileData {
  static List<PremiumProfileModel> premiumProfileDataList = [
    PremiumProfileModel(
      icon: FontAwesomeIcons.user,
      title: "Personal Information",
    ),
    PremiumProfileModel(
      icon: Icons.snippet_folder_outlined,
      title: "Folders",
    ),
    PremiumProfileModel(
      icon: FontAwesomeIcons.bell,
      title: "Notification Settings",
    ),
    PremiumProfileModel(
      icon: Icons.account_balance_wallet_outlined,
      title: "Subscription Settings",
    ),
    PremiumProfileModel(
      icon: Icons.science_outlined,
      title: "Lab Settings",
    ),
    PremiumProfileModel(
      icon: Icons.cloud_upload_outlined,
      title: "User Backup",
    ),
    PremiumProfileModel(
      icon: Icons.info_outline,
      title: "Support",
    ),
  ];
}
