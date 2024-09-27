import 'package:flutter/material.dart';
import 'package:microbiocol/utils/colors.dart';
import 'package:microbiocol/widgets/custom_box.dart';

Widget tile(dynamic data, bool isHasImage,
    {IconData icon = Icons.folder_outlined, double horizontal = 15}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: ListTile(
      minVerticalPadding: 10,
      contentPadding: EdgeInsets.symmetric(horizontal: horizontal),
      visualDensity: const VisualDensity(vertical: 2),
      title: Text(
        data.title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: mprimaryColor,
        ),
      ),
      subtitle: Text(
        data.subTitle.toString(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: mprimaryColor.withOpacity(0.5),
        ),
      ),
      leading: CustommBox(
        isHasBoxShadow: false,
        width: 64,
        height: 64,
        borderRadius: 64,
        color: mprimaryColor.withOpacity(0.2),
        widget: isHasImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(64),
                child: Image.asset(
                  data.imageUrl,
                  fit: BoxFit.cover,
                ),
              )
            : Center(
                child: Icon(
                  icon,
                  size: 50,
                  color: mprimaryColor,
                ),
              ),
        isHasBorder: false,
      ),
    ),
  );
}
