import 'package:flutter/material.dart';
import 'package:microbiocol/models/log_model.dart';

class LogData {
  static final List<LogModel> logDataList = [
    LogModel(
      icon: Icons.account_balance_wallet_outlined,
      logTitle: "Subscription tires",
      time: "16.54 PM",
      imageUrl: null,
    ),
    LogModel(
      icon: Icons.search_sharp,
      logTitle: "Searched “Staphylococcus”",
      time: "16.54 PM",
      imageUrl: null,
    ),
    LogModel(
      icon: null,
      logTitle: "Free Count",
      time: "16.54 PM",
      imageUrl: "assets/images/abacus.svg",
    ),
    LogModel(
      icon: Icons.camera_alt_outlined,
      logTitle: "Image Captured",
      time: "16.54 PM",
      imageUrl: null,
    ),
  ];
}
