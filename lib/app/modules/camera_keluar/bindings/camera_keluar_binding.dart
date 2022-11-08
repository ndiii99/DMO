import 'package:get/get.dart';

import '../controllers/camera_keluar_controller.dart';

class CameraKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraKeluarController>(
      () => CameraKeluarController(),
    );
  }
}
