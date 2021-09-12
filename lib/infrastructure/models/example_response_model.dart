import 'example_model.dart';

class ExampleResponseModel {
  final int status;
  final int code;
  final String message;
  final ExampleModel data;

  ExampleResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory ExampleResponseModel.fromJson(Map<String, dynamic> json) =>
      ExampleResponseModel(
        status: json['status'],
        code: json['code'],
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
