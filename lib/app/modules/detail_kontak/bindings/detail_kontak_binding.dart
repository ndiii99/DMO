import 'package:get/get.dart';

import '../controllers/detail_kontak_controller.dart';

class DetailKontakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKontakController>(
      () => DetailKontakController(),
    );
  }
}
