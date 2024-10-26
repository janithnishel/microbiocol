import 'package:microbiocol/models/subscription_model.dart';

class SubscriptionData {
  static final List<SubscriptionModel> freePackageDataList = [
    SubscriptionModel(
      title: "Lorem ipsum dolor sit amet consectetur.",
    ),
    SubscriptionModel(
      title: "Lorem ipsum dolor sit amet consectetur.",
    ),
    SubscriptionModel(
      title: "Lorem ipsum dolor sit amet consectetur.",
    ),
    SubscriptionModel(
      title: "Lorem ipsum dolor sit amet consectetur.",
    ),
    SubscriptionModel(
      title: "Lorem ipsum dolor sit amet consectetur.",
    ),
  ];

  static final List<SubscriptionModel> techPackageDataList = [
    SubscriptionModel(title: "10 Ids and counts per month"),
  ];
  static final List<SubscriptionModel> analystPackageDataList = [
    SubscriptionModel(title: "25 Ids and counts per month"),
  ];
  static final List<SubscriptionModel> scientistPackageDataList = [
    SubscriptionModel(title: "Unlimited Ids and counts per month"),
  ];
}
