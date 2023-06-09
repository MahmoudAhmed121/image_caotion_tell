class ResponseModel {
  String result;

  ResponseModel({required this.result});

  factory ResponseModel.fromJson(json) {
    return ResponseModel(
      result: json["result"],
    );
  }
}
