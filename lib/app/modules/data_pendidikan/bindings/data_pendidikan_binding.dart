import 'package:get/get.dart';

import '../controllers/data_pendidikan_controller.dart';

class DataPendidikanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPendidikanController>(
      () => DataPendidikanController(),
    );
  }
}
