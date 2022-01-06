// import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// void fireAlarm() {
//   flutterLocalNotificationsPlugin.show(
//     0,
//     "Testing notification",
//     "Well! Received notification Successfully",
//     NotificationDetails(
//       android: AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channel.description,
//         importance: Importance.high,
//         color: Colors.blue,
//         playSound: true,
//         icon: '@mipmap/ic_launcher',
//       ),
//     ),
//   );
//   print(':::::::::::::::::::::object:::::::::::::::::::::');
// }
