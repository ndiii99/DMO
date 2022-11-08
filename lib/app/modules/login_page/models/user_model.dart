// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.nik,
    required this.nama,
    required this.jabatan,
    required this.imei,
    required this.token,
  });

  String? nik;
  String? nama;
  String? jabatan;
  String? imei;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nik: json["nik"],
        nama: json["nama"],
        jabatan: json["jabatan"],
        imei: json["imei"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "nama": nama,
        "jabatan": jabatan,
        "imei": imei,
        "token": token,
      };
}
