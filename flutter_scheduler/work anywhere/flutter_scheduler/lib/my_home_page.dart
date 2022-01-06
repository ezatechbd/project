import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

import 'fcm_utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await AndroidAlarmManager.periodic(
                      const Duration(seconds: 1),
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
                  child: Text('End Task'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
