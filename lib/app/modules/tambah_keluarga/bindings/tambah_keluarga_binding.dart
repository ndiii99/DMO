import 'package:get/get.dart';

import '../controllers/tambah_keluarga_controller.dart';

class TambahKeluargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKeluargaController>(
      () => TambahKeluargaController(),
    );
  }
}
