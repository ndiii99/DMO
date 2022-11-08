// ignore_for_file: unused_local_variable

import 'package:camera/camera.dart';
import 'package:dmo_flutter/app/services/FirebaseMessageService.dart';
import 'package:dmo_flutter/app/services/notofication_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/page_index_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

List<CameraDescription> cameras = [];
void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LocalNotificationService.initialize();
  await Get.putAsync(() => FirebaseMessageService().init(), permanent: true);
  FirebaseMessaging.onBackgroundMessage(FirebaseMessageService
      .firebaseMessagingBackground); // await requestPermission();

  final pageC = Get.put(PageIndexController(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: Routes.SPLASH_SCREEN,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
