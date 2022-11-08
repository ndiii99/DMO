import 'package:get/get.dart';

import '../controllers/detail_keluarga_controller.dart';

class DetailKeluargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKeluargaController>(
      () => DetailKeluargaController(),
    );
  }
}
