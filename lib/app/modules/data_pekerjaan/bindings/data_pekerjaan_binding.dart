import 'package:get/get.dart';

import '../controllers/data_pekerjaan_controller.dart';

class DataPekerjaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPekerjaanController>(
      () => DataPekerjaanController(),
    );
  }
}
