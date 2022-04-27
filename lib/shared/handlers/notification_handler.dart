import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:finote/shared/injector.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

const String NOTIFICATION_CHANNEL_NAME = "finote_channel";

Map<NotificationPermission, bool> scheduleChannelPermissions = {};

List<NotificationPermission> channelPermissions = [
  NotificationPermission.Alert,
  NotificationPermission.Sound,
  NotificationPermission.Badge,
  NotificationPermission.Light,
  NotificationPermission.Vibration,
  NotificationPermission.CriticalAlert,
  NotificationPermission.FullScreenIntent
];

Future<void> initNotification() async {
  await AwesomeNotifications().initialize(
    "resource://drawable/res_app_icon",
    [
      NotificationChannel(
          importance: NotificationImportance.High,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          criticalAlerts: true,
          
          channelGroupKey: 'finote_channel_group',
          channelKey: NOTIFICATION_CHANNEL_NAME,
          channelName: 'Finote Notifications',
          channelDescription: 'Finote Notification channel for basic utility',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white)
    ],
    channelGroups: [
      NotificationChannelGroup(
          channelGroupkey: 'finote_channel_group',
          channelGroupName: 'Finote Group')
    ],
    debug: true,

  );
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
  AwesomeNotifications()
      .actionStream
      .listen((ReceivedNotification receivedNotification) {
    getIt<Logger>().d(
        "Notification Received : ${receivedNotification.title}, ${receivedNotification.body}, ${receivedNotification.payload}");
    // Navigator.of(context).pushNamed('/NotificationPage', arguments: {
    //   // your page params. I recommend you to pass the
    //   // entire *receivedNotification* object
    //   id: receivedNotification.id
    // });
  });
}

void refreshScheduleChannelPermissions() {
  AwesomeNotifications()
      .checkPermissionList(
          channelKey: NOTIFICATION_CHANNEL_NAME,
          permissions: channelPermissions)
      .then(
        (List<NotificationPermission> permissionsAllowed) {},
      );
}
