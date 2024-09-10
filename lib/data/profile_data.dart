import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:microbiocol/models/profile_model.dart';

class ProfileData {
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
