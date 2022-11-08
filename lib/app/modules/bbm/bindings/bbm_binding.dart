import 'package:get/get.dart';

import '../controllers/bbm_controller.dart';

class BbmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BbmController>(
      () => BbmController(),
    );
  }
}
