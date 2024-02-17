import 'package:entrepreneur_app/app/controller/auth_controller.dart';
import 'package:entrepreneur_app/app/modules/loginpage/controllers/loginpage_controller.dart';
import 'package:entrepreneur_app/app/modules/register/controllers/register_controller.dart';
import 'package:entrepreneur_app/app/services/local_notification_service.dart';
import 'package:entrepreneur_app/app/services/local_notification_service_ada.dart';
import 'package:entrepreneur_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:sizer/sizer.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PusherChannelsFlutter.getInstance();
  await Permission.storage.request();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
      print("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
        print("message.data11 ${message.data}");
        if (message.notification!.android!.imageUrl == null) {
          LocalNotificationService.createanddisplaynotification(message);
          print('ini yang jalan');
          await pusher.connect();
        } else {
          LocalNotificationServiceAda.createanddisplaynotification(message);
          print('ini yang jalan aa');
          await pusher.connect();
        }
      }
    },
  );
  print('Print FCM Token: $fcmToken');
  Get.put(AuthController(), permanent: true);
  Get.put(RegisterController(), permanent: true);
  Get.put(LoginpageController(), permanent: true);
  await initializeDateFormatting('id_ID', null).then((_) => {
        runApp(
          Sizer(
            builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Application",
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
              );
            },
          ),
        )
      });
}

Future<void> backgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    print(message.data);
    print("ini${message.notification!.title}");
    if (message.notification!.android!.imageUrl == null) {
      LocalNotificationService.createanddisplaynotification(message);
      print('ini yang jalan');
      await pusher.connect();
    } else {
      LocalNotificationServiceAda.createanddisplaynotification(message);
      print('ini yang jalan aa');
      await pusher.connect();
    }
  }
}
