import 'package:get/get.dart';

import '../controllers/laporan_approval_controller.dart';

class LaporanApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanApprovalController>(
      () => LaporanApprovalController(),
    );
  }
}
