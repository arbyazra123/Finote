// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:finote/shared/injector.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:logger/logger.dart';

// Future<void> initFCM() async {
//   await FirebaseMessaging.instance.requestPermission();
//   FirebaseMessaging.instance.getToken().then((token) {
//     print("Firebase Token: $token");
//   });
//   FirebaseMessaging.onMessageOpenedApp.listen((message) {
//     print("Message opened: ${message.toString()}");
//   });
//   FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
//     getIt<Logger>().d('Handling a background message ${message.messageId}');
//   });
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   await FirebaseMessaging.instance.getInitialMessage().then((value) {
//     if (value != null) {
//       AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 11,
//           channelKey: NOTIFICATION_CHANNEL_NAME,
//           title: value.notification?.title ?? "Finote",
//           body: value.notification?.body ?? "",
//         ),
//       );
//     }
//   });

//   FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
//     getIt<Logger>().d("FirebaseMessaging.onMessage : ${message.toString()}");
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: 10,
//             channelKey: NOTIFICATION_CHANNEL_NAME,
//             title: message?.notification?.title ?? "Finote",
//             body: message?.notification?.body ?? ""));
//   });
// }
