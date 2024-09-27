import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_button.dart';
import 'package:microbiocol/widgets/title_bar.dart';

class BackupOption extends StatelessWidget {
  const BackupOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mwhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    titleBar(context, title: "Backup Options"),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildBackupOption(
                      "assets/images/google-drive.svg",
                      "Google Drive",
                    ),
                    _buildBackupOption(
                      "assets/images/onedrive.svg",
                      "OneDrive",
                    ),
                    _buildBackupOption(
                      "assets/images/dropbox.svg",
                      "Dropbox",
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

  // build single backup option
  Widget _buildBackupOption(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomButton(
        isHasWidget: true,
        isHasBorder: true,
        color: mwhiteColor,
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: mprimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
