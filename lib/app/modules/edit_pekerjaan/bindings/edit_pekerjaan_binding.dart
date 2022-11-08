import 'package:get/get.dart';

import '../controllers/edit_pekerjaan_controller.dart';

class EditPekerjaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPekerjaanController>(
      () => EditPekerjaanController(),
    );
  }
}
