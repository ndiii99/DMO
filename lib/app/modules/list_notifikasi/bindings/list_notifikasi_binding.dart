import 'package:get/get.dart';

import '../controllers/list_notifikasi_controller.dart';

class ListNotifikasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListNotifikasiController>(
      () => ListNotifikasiController(),
    );
  }
}
