import 'dart:convert';

List<Registration> registrationFromJson(String str) => List<Registration>.from(
    json.decode(str).map((x) => Registration.fromJson(x)));

String registrationToJson(Registration data) => json.encode(data.toJson());

class Registration {
  final String username;
  final String email;
  final String password;

  Registration({
    required this.username,
    required this.email,
    required this.password,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
