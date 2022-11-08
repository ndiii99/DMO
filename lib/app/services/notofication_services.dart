import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      ),
    );

    _notificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message) async {
    try {
      final id = Random().nextInt(1000);
      final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "default_notification_channel_id",
          "channelName",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );
      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
      );
    } catch (e) {
      print(e);
    }
  }
}
