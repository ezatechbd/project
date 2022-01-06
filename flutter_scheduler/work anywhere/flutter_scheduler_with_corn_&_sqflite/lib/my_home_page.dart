import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scheduler/service/db_provider.dart';
import 'package:flutter_scheduler/service/notification_service.dart';
import 'package:flutter_scheduler/utils/sp_utils.dart';

import 'notification_history.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController titleController = new TextEditingController();
  final TextEditingController descriptionController =
      new TextEditingController();

  @override
  void initState() {
    DBProvider().initDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Alarm Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: titleController,
                    decoration: new InputDecoration(
                      hintText: 'Notification title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: descriptionController,
                    decoration: new InputDecoration(
                      hintText: 'Notification description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPref().setTitle(titleController.text ?? '');
                    SharedPref()
                        .setDescription(descriptionController.text ?? '');
                  },
                  child: Text('Set Task   '),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await AndroidAlarmManager.periodic(
                      const Duration(minutes: 1),
                      0,
                      fireAlarm,
                      wakeup: true,
                      rescheduleOnReboot: true,
                    );
                  },
                  child: Text('Start Task'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await AndroidAlarmManager.cancel(0);
                    print(
                        '::::::::::::::::::Alarm Timer Canceled::::::::::::::::::');
                  },
                  child: Text('End Task  '),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      useRootNavigator: false,
                      builder: (context) => NotificationDialogue(),
                    );
                  },
                  child: Text('  History  '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
