import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_scheduler/utils/sp_utils.dart';
import '../utils/fcm_utils.dart';

Future<void> fireAlarm() async {
  String notificationTitle = await SharedPref().getTitle();
  String notificationDescription = await SharedPref().getDescription();
  flutterLocalNotificationsPlugin.show(
    0,
    notificationTitle,
    notificationDescription,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channel.description,
        importance: Importance.high,
        color: Colors.blue,
        playSound: true,
        icon: '@mipmap/ic_launcher',
      ),
    ),
  );
  print(notificationTitle);
  print(notificationDescription);
  print(':::::::::::::::::::::Notification fired!!!:::::::::::::::::::::');
}
