import 'package:get/get.dart';

import '../controllers/camera_masuk_controller.dart';

class CameraMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraMasukController>(
      () => CameraMasukController(),
    );
  }
}
