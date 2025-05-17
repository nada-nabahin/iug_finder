import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_cubit.dart';

class FirebaseApi {
  final _firebaseMassaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.defaultImportance,
  );
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await _firebaseMassaging.requestPermission();
    String? fcmToken = await _firebaseMassaging.getToken();
    print('Firebase Token: $fcmToken');

    initPushNotifications();
    initLocalNotification();
  }

  ///
  ///

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Data: ${message.data}');
    print('Notification: ${message.notification}');
  }

  void handelMassage(RemoteMessage? message) {
    if (message == null) return;
    final navigationBarCubit = NavigationBarCubit(); // Create an instance
    navigationBarCubit.updateIndex(1);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handelMassage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMassage);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((massage) {
      final notification = massage.notification;
      if (notification == null) return;
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          ),
        ),
        payload: jsonEncode(massage.toMap()),
      );
    });
  }

  Future initLocalNotification() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const initializationSettings = InitializationSettings(
      android: android,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse response) async {
      final payload = response.payload;
      if (payload != null) {
        final data = jsonDecode(payload);
        print('Payload: $data');
        handelMassage(RemoteMessage.fromMap(data));
      }
      final platform =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await platform?.createNotificationChannel(_androidChannel);
    });
  }
}
