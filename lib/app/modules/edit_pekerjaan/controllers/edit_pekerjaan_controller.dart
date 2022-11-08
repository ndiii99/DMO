import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class EditPekerjaanController extends GetxController {
  final getStorage = GetStorage();
  TextEditingController namaE = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nik = TextEditingController();
  TextEditingController jabatan = TextEditingController();
  TextEditingController awalkontrak = TextEditingController();
  TextEditingController akhirkontak = TextEditingController();

  TextEditingController sbu = TextEditingController();
  TextEditingController status = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late var name = '';
  late var nikE = '';
  late var jabatanE = '';
  String? selectedValue;
  List<String> items = [
    'KTP',
    'SIM',
    'Passport',
  ];

  void onInit() {
    final data = getStorage.read('user') as Map<String, dynamic>;
    name = data['nama'];
    nikE = data['nik'];
    jabatanE = data['job'];
    print(data['nik']);
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
      awalkontrak.text = date;
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
      akhirkontak.text = date;
      update();
    }
  }

  Future<void> rubahData() async {
    if (namaE.text.isNotEmpty &&
        email.text.isNotEmpty &&
        nik.text.isNotEmpty &&
        jabatan.text.isNotEmpty &&
        awalkontrak.text.isNotEmpty &&
        akhirkontak.text.isNotEmpty &&
        sbu.text.isNotEmpty &&
        status.text.isNotEmpty) {
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
