class ReadModel {
  final String imageUrl;
  final String id;
  final String? readableValue;
  final double progressValue;

  ReadModel(
    this.progressValue, {
    required this.imageUrl,
    required this.id,
    required this.readableValue,
  });
}
