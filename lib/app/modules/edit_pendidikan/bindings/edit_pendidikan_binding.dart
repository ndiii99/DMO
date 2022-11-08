import 'package:get/get.dart';

import '../controllers/edit_pendidikan_controller.dart';

class EditPendidikanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPendidikanController>(
      () => EditPendidikanController(),
    );
  }
}
