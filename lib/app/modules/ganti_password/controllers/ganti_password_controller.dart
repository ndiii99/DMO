import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GantiPasswordController extends GetxController {
  var isPasswordHidden = true.obs;
  final getStorage = GetStorage();
  TextEditingController passlama = TextEditingController();
  TextEditingController passBaru = TextEditingController();

  TextEditingController confPass = TextEditingController();
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

  void toggle() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> rubahData() async {
    if (passlama.text.isNotEmpty &&
        passBaru.text.isNotEmpty &&
        confPass.text.isNotEmpty) {
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
