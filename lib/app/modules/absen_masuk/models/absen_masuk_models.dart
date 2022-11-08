// To parse this JSON data, do
//
//     final absenMasukModel = absenMasukModelFromJson(jsonString);

import 'dart:convert';

AbsenMasukModel absenMasukModelFromJson(String str) =>
    AbsenMasukModel.fromJson(json.decode(str));

String absenMasukModelToJson(AbsenMasukModel data) =>
    json.encode(data.toJson());

class AbsenMasukModel {
  AbsenMasukModel({
    required this.uuid,
    required this.nikEmployee,
    required this.getLatitude,
    required this.getLongitude,
    required this.alamat,
    required this.tanggal,
    required this.gambar,
    required this.jenis,
    required this.keterangan,
  });

  String? uuid;
  String? nikEmployee;
  String? getLatitude;
  String? getLongitude;
  String? alamat;
  String? tanggal;
  String? gambar;
  String? jenis;
  String? keterangan;

  factory AbsenMasukModel.fromJson(Map<String, dynamic> json) =>
      AbsenMasukModel(
        uuid: json["uuid"],
        nikEmployee: json["nik_employee"],
        getLatitude: json["getLatitude"],
        getLongitude: json["getLongitude"],
        alamat: json["alamat"],
        tanggal: json["tanggal"],
        gambar: json["gambar"],
        jenis: json["jenis"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "nik_employee": nikEmployee,
        "getLatitude": getLatitude,
        "getLongitude": getLongitude,
        "alamat": alamat,
        "tanggal": tanggal,
        "gambar": gambar,
        "jenis": jenis,
        "keterangan": keterangan,
      };
}
