import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataPersonalController extends GetxController {
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
  late var name = '';
  late String defaultImage = 'https://ui-avatars.com/api/?name=$name';

  final count = 0.obs;
  @override
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
}
