import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DetailPendidikanController extends GetxController {
  final getStorage = GetStorage();
  TextEditingController nama = TextEditingController();
  TextEditingController jenjang = TextEditingController();
  TextEditingController masuk = TextEditingController();
  TextEditingController keluar = TextEditingController();

  TextEditingController jenis = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController keterangan = TextEditingController();
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
      masuk.text = date;
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
      keluar.text = date;
      update();
    }
  }

  Future<void> rubahData() async {
    if (nama.text.isNotEmpty &&
        jenis.text.isNotEmpty &&
        masuk.text.isNotEmpty &&
        keluar.text.isNotEmpty &&
        jenis.text.isNotEmpty &&
        status.text.isNotEmpty &&
        keterangan.text.isNotEmpty) {
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
