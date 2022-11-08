import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final getStorage = GetStorage();
  RxBool isLoading = false.obs;
  late var name = '';
  late var nik = '';
  late var jabatan = '';
  late var imei = '';
  late String defaultImage = 'https://ui-avatars.com/api/?name=$name';

  @override
  void onInit() {
    super.onInit();
    //error dissini jan
    update();
    final data = getStorage.read('user');
    name = data['nama'];
    nik = data['nik'];
    jabatan = data['job'];
    imei = data['imei'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
