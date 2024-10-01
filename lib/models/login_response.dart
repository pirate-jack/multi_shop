import 'dart:convert';

// Function to convert JSON string to List<LoginResponse>
LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

// Function to convert List<LoginResponse> to JSON string
String loginResponseToJson(List<LoginResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginResponse {
  final String id;
  final String username;
  final String email;
  final String? otp;
  final String? fcm;
  final bool verification;
  final String phone;
  final bool phoneVerification;
  final String userType;
  final String? profile;
  final String userToken;

  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    this.otp,
    this.fcm,
    required this.verification,
    required this.phone,
    required this.phoneVerification,
    required this.userType,
    this.profile,
    required this.userToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        otp: json["otp"],
        fcm: json["fcm"],
        verification: json["verification"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        userType: json["userType"],
        profile: json["profile"],
        userToken: json["userToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "otp": otp,
        "fcm": fcm,
        "verification": verification,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "userType": userType,
        "profile": profile,
        "userToken": userToken,
      };
}
