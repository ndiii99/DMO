import 'package:dmo_flutter/app/services/notofication_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseMessageService extends GetxService {
  Future<FirebaseMessageService> init() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((message) async {
      if (kDebugMode) {
        LocalNotificationService.display(message);
        print(message.notification!.title);
        var _routeName = message.data['route'];
        Get.toNamed(_routeName);
        // Get.snackbar(
        //   message.notification?.title ?? '',
        //   message.notification?.body ?? '',
        //   margin: EdgeInsets.all(10),
        //   borderWidth: 1,
        //   icon: Icon(Icons.info),
        // );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      if (kDebugMode) {
        //LocalNotificationService.display(message);
        print('onMessageOpenedApp');
        print(message);
        print('===========');
        var _routeName = message.data['route'];
        Get.toNamed(_routeName);
      }
    });

    return this;
  }

  static Future<void> firebaseMessagingBackground(RemoteMessage message) async {
    if (kDebugMode) {
      //LocalNotificationService.display(message);
      print('Handle a Background Message ${message.messageId}');
      print(message);
      print('===========');
      var _routeName = message.data['route'];
      Get.toNamed(_routeName);
    }
  }

  Future<NotificationSettings> getPermission() {
    return FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
  }
}
