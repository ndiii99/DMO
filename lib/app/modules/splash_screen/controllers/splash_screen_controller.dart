import 'dart:async';

import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  final getStorage = GetStorage();
  startTime() async {
    if (getStorage.read('id') != null) {
      Future.delayed(Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      Future.delayed(Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.LOGIN_PAGE);
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    //startTime();
  }

  @override
  void onReady() {
    super.onReady();

    startTime();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
