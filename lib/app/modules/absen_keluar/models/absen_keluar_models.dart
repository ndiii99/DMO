// To parse this JSON data, do
//
//     final absenPulangModel = absenPulangModelFromJson(jsonString);

import 'dart:convert';

AbsenPulangModel absenPulangModelFromJson(String str) =>
    AbsenPulangModel.fromJson(json.decode(str));

String absenPulangModelToJson(AbsenPulangModel data) =>
    json.encode(data.toJson());

class AbsenPulangModel {
  AbsenPulangModel({
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

  String uuid;
  String nikEmployee;
  String getLatitude;
  String getLongitude;
  String alamat;
  DateTime tanggal;
  String gambar;
  String jenis;
  String keterangan;

  factory AbsenPulangModel.fromJson(Map<String, dynamic> json) =>
      AbsenPulangModel(
        uuid: json["uuid"],
        nikEmployee: json["nik_employee"],
        getLatitude: json["getLatitude"],
        getLongitude: json["getLongitude"],
        alamat: json["alamat"],
        tanggal: DateTime.parse(json["tanggal"]),
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
        "tanggal": tanggal.toIso8601String(),
        "gambar": gambar,
        "jenis": jenis,
        "keterangan": keterangan,
      };
}
