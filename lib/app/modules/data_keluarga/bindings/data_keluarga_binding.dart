import 'package:get/get.dart';

import '../controllers/data_keluarga_controller.dart';

class DataKeluargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataKeluargaController>(
      () => DataKeluargaController(),
    );
  }
}
