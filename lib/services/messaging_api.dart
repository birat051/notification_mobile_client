import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_mobile_client/args.dart';
import 'package:notification_mobile_client/main.dart';
import 'package:notification_mobile_client/notification_screen.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Recieved background notification');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
  var imageUrl = message.notification?.android?.imageUrl ??
      message.notification?.apple?.imageUrl;
  if (imageUrl != null) {
    // Handle image downloading/displaying logic here
    print('Image URL: $imageUrl');
  }
}

//image daalna hain iska
void handleMessage(RemoteMessage? message) async {
  if (message == null) {
    return;
  }
  var imageUrl = message.notification?.android?.imageUrl ??
      message.notification?.apple?.imageUrl;
  navigatorKey.currentState?.pushNamed(NotificationScreen.id,
      arguments: NotificationArguments(message.notification?.title,
          message.notification?.body, imageUrl, message.data));
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}

class MessagingApi {
  final _messaging = FirebaseMessaging.instance;
  String? _token;
  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: 'Important notifications', importance: Importance.high);
  final _localNotifications = FlutterLocalNotificationsPlugin();
  Future initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: iOS);
    // final iOS = IOS
    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            if (notificationResponse.payload != null) {
              final message = RemoteMessage.fromMap(
                  jsonDecode(notificationResponse.payload!));
              handleMessage(message);
            }
            break;
          case NotificationResponseType.selectedNotificationAction:
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse notificationResponse) {
        if (notificationResponse.payload != null) {
          final message =
              RemoteMessage.fromMap(jsonDecode(notificationResponse.payload!));
          handleMessage(message);
        }
      },
    );
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initNotifications() async {
    try {
      await _messaging.requestPermission();
      _token = await _messaging.getToken();
      await initPushNotifications();
      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
      // FirebaseMessaging.onMessage.listen((message) {
      //   final notification = message.notification;
      //   if (notification == null) return;
      //   _localNotifications.show(
      //       notification.hashCode,
      //       notification.title,
      //       notification.body,
      //       NotificationDetails(
      //         android: AndroidNotificationDetails(
      //             _androidChannel.id, _androidChannel.name,
      //             channelDescription: _androidChannel.description,
      //             icon: '@drawable/ic_launcher'),
      //       ),
      //       payload: jsonEncode(message.toMap()));
      // });
      // await initLocalNotifications();
    } catch (e) {
      print('Error occured while trying to recieve notification $e');
    }
  }

  get getToken => _token;
}

MessagingApi messaging = MessagingApi();
