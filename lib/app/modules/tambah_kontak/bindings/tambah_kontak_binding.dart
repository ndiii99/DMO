import 'package:get/get.dart';

import '../controllers/tambah_kontak_controller.dart';

class TambahKontakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKontakController>(
      () => TambahKontakController(),
    );
  }
}
