import 'dart:convert';

class SuccessModel {
  final bool status;
  final String message;

  SuccessModel({
    required this.status,
    required this.message,
  });

  factory SuccessModel.fromJson(Map<String, dynamic> json) {
    return SuccessModel(
      status: json['status'] ?? false,
      message: json['message']?.toString() ?? '',
    );
  }
}

SuccessModel successModelFromJson(String str) {
  final Map<String, dynamic> jsonData = json.decode(str);
  return SuccessModel.fromJson(jsonData);
}