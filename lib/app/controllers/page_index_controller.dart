import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geolocator/geolocator.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('ini botnav');
  }

  void changePage(int i) async {
    switch (i) {
      case 1:
        pageIndex.value = i;
        Get.offNamed(Routes.ABSEN);
        break;
      case 2:
        pageIndex.value = i;
        Get.offNamed(Routes.PROFILE);
        break;
      default:
        pageIndex.value = i;
        Get.offNamed(Routes.HOME);
        break;
    }
  }
}
