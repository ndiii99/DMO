import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PengajuanController extends GetxController {
  String? selectedValue;
  List<String> items = [
    'Cuti',
    'Ijin',
    'Sakit',
    'Lembur',
    'Cuti Khusus',
    'Perjalanan Dinas',
    'Ijin 1/2 Hari',
    'Ijin Datang Telat'
  ];
  DateTime? dateawal;
  TextEditingController dateAwal = TextEditingController();
  TextEditingController dateAkhir = TextEditingController();
  TextEditingController alasan = TextEditingController();
  final ImagePicker picker = ImagePicker();
  //XFile? image;
  File? image;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  choseDateAwal() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (pickedDate != null) {
      // dateawal = pickedDate;
      // dateAwal
      //   ..text = DateFormat('dd-MM-yyyy').format(dateawal!)
      //   ..selection = TextSelection.fromPosition(TextPosition(
      //       offset: dateAwal.text.length, affinity: TextAffinity.upstream));
      String date = DateFormat('dd-MM-yyyy').format(pickedDate);
      dateAwal.text = date;
      update();
    }
  }

  choseDateAkhir() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040));
    if (pickedDate != null) {
      String date = DateFormat('dd-MM-yyyy').format(pickedDate);
      dateAkhir.text = date;
      update();
    }
  }

  Future getImage(ImageSource imageSource) async {
    try {
      final image = await picker.pickImage(
          source: imageSource, preferredCameraDevice: CameraDevice.front);
      if (image == null) return;

      final imageTemporary = File(image.path);

      this.image = imageTemporary;
    } on PlatformException catch (e) {
      Get.snackbar("Terjadi Kesalahan", "Tidak Dapat Mengambil Gambar : $e");
    }
    update();
  }

  coba() {
    print(alasan.text);
    print("date awal");
    print(dateAwal.text);
    print('date akhir');
    print(dateAkhir.text);
  }
}
