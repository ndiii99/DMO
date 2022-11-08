import 'package:get/get.dart';

import '../controllers/kontak_darurat_controller.dart';

class KontakDaruratBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontakDaruratController>(
      () => KontakDaruratController(),
    );
  }
}
