import 'package:get/get.dart';

import '../controllers/edit_personal_controller.dart';

class EditPersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPersonalController>(
      () => EditPersonalController(),
    );
  }
}
