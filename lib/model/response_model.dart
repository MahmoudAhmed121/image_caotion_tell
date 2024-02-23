class ImageModel {
  String result;

  ImageModel({required this.result});

  factory ImageModel.fromJson(json) {
    return ImageModel(
      result: json["result"],
    );
  }
}
