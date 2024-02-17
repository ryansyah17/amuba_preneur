import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/launcher_icon');
  DarwinInitializationSettings darwinInitializationSettings =
      const DarwinInitializationSettings();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/launcher_icon"),
      iOS: DarwinInitializationSettings(),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
            "pushnotificationapp",
            "pushnotificationappchannel",
            importance: Importance.max,
            priority: Priority.high,
            largeIcon: DrawableResourceAndroidBitmap('@mipmap/launcher_icon'),
            icon: "@mipmap/launcher_icon",
            // styleInformation: bigPictureStyleInformation,
          ),
          iOS: DarwinNotificationDetails());

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['data'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
