// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(dynamic str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  dynamic companyname;
  dynamic companyUniqueId;
  dynamic email;
  dynamic phone;
  dynamic password;
  dynamic repassword;
  dynamic id;
  dynamic city;
  dynamic createdAt;
  dynamic editedAt;
  dynamic user;

  UserData({
    required this.companyname,
    required this.companyUniqueId,
    required this.email,
    required this.phone,
    required this.password,
    required this.repassword,
    required this.id,
    required this.city,
    required this.createdAt,
    required this.editedAt,
    required this.user,
  });

  factory UserData.fromJson(Map<dynamic, dynamic> json) => UserData(
        companyname: json["companyname"],
        companyUniqueId: json["companyUniqueId"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        repassword: json["repassword"],
        id: json["id"],
        city: json["city"],
        createdAt: json["created_at"],
        editedAt: json["edited_at"],
        user: json["user"],
      );

  Map<dynamic, dynamic> toJson() => {
        "companyname": companyname,
        "companyUniqueId": companyUniqueId,
        "email": email,
        "phone": phone,
        "password": password,
        "repassword": repassword,
        "id": id,
        "city": city,
        "created_at": createdAt,
        "edited_at": editedAt,
        "user": user,
      };
}
