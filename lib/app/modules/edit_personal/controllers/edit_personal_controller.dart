import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class EditPersonalController extends GetxController {
  final getStorage = GetStorage();
  TextEditingController namaE = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController jenisKelamin = TextEditingController();
  TextEditingController tempatLahir = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController hanphone = TextEditingController();

  TextEditingController tmpt = TextEditingController();
  TextEditingController statusPernikahan = TextEditingController();
  TextEditingController agama = TextEditingController();
  TextEditingController nomorIdentitas = TextEditingController();
  TextEditingController jenisIdentitas = TextEditingController();
  TextEditingController npwp = TextEditingController();

  TextEditingController keterangan = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late var name = '';
  String? selectedValue;
  List<String> items = [
    'KTP',
    'SIM',
    'Passport',
  ];
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
      tanggalLahir.text = date;
      update();
    }
  }

  void onInit() {
    final data = getStorage.read('user');
    name = data['nama'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> login() async {
    if (namaE.text.isNotEmpty &&
        email.text.isNotEmpty &&
        jenisKelamin.text.isNotEmpty &&
        tempatLahir.text.isNotEmpty &&
        tanggalLahir.text.isNotEmpty &&
        hanphone.text.isNotEmpty &&
        tmpt.text.isNotEmpty &&
        statusPernikahan.text.isNotEmpty &&
        agama.text.isNotEmpty &&
        nomorIdentitas.text.isNotEmpty &&
        jenisIdentitas.text.isNotEmpty &&
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
