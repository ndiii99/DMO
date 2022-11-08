import 'package:get/get.dart';

import '../controllers/kunjungan_controller.dart';

class KunjunganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KunjunganController>(
      () => KunjunganController(),
    );
  }
}
