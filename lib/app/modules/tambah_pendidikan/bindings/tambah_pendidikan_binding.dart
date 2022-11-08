import 'package:get/get.dart';

import '../controllers/tambah_pendidikan_controller.dart';

class TambahPendidikanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPendidikanController>(
      () => TambahPendidikanController(),
    );
  }
}
