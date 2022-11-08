import 'package:get/get.dart';

import '../controllers/laporan_pengajuan_controller.dart';

class LaporanPengajuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPengajuanController>(
      () => LaporanPengajuanController(),
    );
  }
}
