import 'package:get/get.dart';

import '../controllers/detail_pendidikan_controller.dart';

class DetailPendidikanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPendidikanController>(
      () => DetailPendidikanController(),
    );
  }
}
