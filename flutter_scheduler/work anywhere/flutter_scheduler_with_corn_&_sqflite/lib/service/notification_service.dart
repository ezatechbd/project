import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_scheduler/service/db_provider.dart';
import 'package:flutter_scheduler/utils/sp_utils.dart';
import '../utils/fcm_utils.dart';
import 'package:cron/cron.dart';

Future<void> fireAlarm() async {
  print('::::::::::::::::::Fire Alarm started::::::::::::::::::');
  String notificationTitle = await SharedPref().getTitle();
  String notificationDescription = await SharedPref().getDescription();
  DBProvider dbProvider = DBProvider();
  final cron = Cron();

  cron.schedule(Schedule.parse('52 16 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('53 16 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('55 16 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('57 16 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('59 16 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('01 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('05 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('20 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('30 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('40 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('42 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('45 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('51 17 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('01 18 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('54 18 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('57 18 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('30 19 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('45 19 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('05 20 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('35 20 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('38 20 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('21 21 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('22 21 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('41 21 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('22 22 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('23 23 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('45 23 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('54 23 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('59 23 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('30 03 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('30 04 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('32 05 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('23 06 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });

  cron.schedule(Schedule.parse('07 07 * * *'), () async {
    dbProvider.addToNotificationData('Task', 'Successful', DateTime.now().toString());
    print('Notification fired!!!');
  });
}
