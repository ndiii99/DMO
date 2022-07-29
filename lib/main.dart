import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/page_index_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  final pageC = Get.put(PageIndexController(), permanent: true);
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
