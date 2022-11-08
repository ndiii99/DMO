import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class TambahKeluargaController extends GetxController {
  final getStorage = GetStorage();
  TextEditingController nama = TextEditingController();
  TextEditingController hubungan = TextEditingController();
  TextEditingController pendidikan = TextEditingController();
  TextEditingController kelamin = TextEditingController();

  TextEditingController pekerjaan = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? selectedValue;
  List<String> items = [
    'KTP',
    'SIM',
    'Passport',
  ];

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> rubahData() async {
    if (nama.text.isNotEmpty &&
        hubungan.text.isNotEmpty &&
        kelamin.text.isNotEmpty &&
        pendidikan.text.isNotEmpty &&
        pekerjaan.text.isNotEmpty) {
      print('success');
    } else {
      Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          content: Column(
            children: [
              Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.red,
                size: 75,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Harap Melengkapi Inputan.",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ));
    }
  }
}