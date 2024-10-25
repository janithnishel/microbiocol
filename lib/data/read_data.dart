import 'package:microbiocol/models/read_model.dart';

class ReadData {
  // this list represent the ongoing read data
  static final List<ReadModel> ongoinReadDataList = [
    ReadModel(
        imageUrl: "assets/images/amoeba.svg",
        id: "Id 06-07-2024 18 29",
        readableValue: "2hrs 10mins",
        0.9),
    ReadModel(
        imageUrl: "assets/images/basillus.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.8),
    ReadModel(
        imageUrl: "assets/images/bacteria.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.45),
    ReadModel(
        imageUrl: "assets/images/basillus.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.87),
    ReadModel(
        imageUrl: "assets/images/basillus.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.6),
    ReadModel(
        imageUrl: "assets/images/basillus.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.4),
    ReadModel(
        imageUrl: "assets/images/basillus.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.99),
  ];

  //this list represent the completed read data
  static final List<ReadModel> completedReadDataList = [
    ReadModel(
        imageUrl: "assets/images/amoeba.svg",
        id: "Id 06-07-2024 18 29",
        readableValue: null,
        0.34),
    ReadModel(
        imageUrl: "assets/images/basillus.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.78),
    ReadModel(
        imageUrl: "assets/images/bacteria.png",
        id: "Id 06-07-2024 19 23",
        readableValue: "1hrs 30mins",
        0.5),
    ReadModel(
        imageUrl: "assets/images/amoeba.svg",
        id: "Id 06-07-2024 18 29",
        readableValue: null,
        0.2),
  ];
}
