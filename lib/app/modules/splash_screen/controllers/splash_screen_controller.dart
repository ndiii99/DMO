import 'dart:async';

import 'package:dmo_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // final prefs = await SharedPreferences.getInstance();
    // bool login;
    // login = prefs.getBool('login') ?? false;
    // var _duration = Duration(seconds: 5);
    // return Timer(_duration, () {
    //   login ? Get.offAllNamed(Routes.HOME) : Get.offAllNamed(Routes.LOGIN_PAGE);
    // });
  }

  @override
  void onInit() {
    super.onInit();
    //startTime();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    startTime();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
