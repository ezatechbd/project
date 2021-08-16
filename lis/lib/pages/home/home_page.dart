import 'package:ati_lis/config/fcm_utils.dart';
import 'package:ati_lis/model/report_model.dart';
import 'package:ati_lis/services/report_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ati_lis/config/common_const.dart';
import 'package:ati_lis/custom/drawer/drawer_menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'patient_report_view/patient_view.dart';
import 'report_view_page.dart';
import 'dart:ui';
import 'dart:developer';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Report patientInfo = new Report();
  var isLoading = true;
  String title = 'Title info';

  PopupItem notificationInfo;
  List<PopupItem> _list = [
    PopupItem(1, "First Notification"),
    PopupItem(2, "Second Notification"),
    PopupItem(3, "Third Notification"),
    PopupItem(4, "Fourth Notification"),
  ];

  //works when app is in foreground mode
  foregroundMode() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        log(notification.title);
        log(message.from);
        setState(() {
          title = notification.title;
        });
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
  }

  //works when app is in background mode and user taps on the notification
  backgroundMode() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        log(notification.body);
        setState(() {
          title = notification.title;
        });
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
  }

  // getFirebaseToken() async {
  //   String token = await FirebaseMessaging.instance.getToken();
  //   log('Token: $token');
  // }

  @override
  void initState() {
    Webservice().fetchPosts().then((data) {
      setState(() {
        patientInfo = data;
        isLoading = false;
      });
    });
    foregroundMode();
    backgroundMode();
    // getFirebaseToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = patientInfo.patientReportInfo;
    return Scaffold(
      appBar: getAppBar(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(cViolet),
              ),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    log(title);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportViewPage(
                          indexNo: index,
                          patientInfo: patientInfo,
                        ),
                      ),
                    );
                  },
                  child: PatientView(
                    patientName: data[index].name.toString(),
                    pId: data[index].pId.toString(),
                    gender: data[index].gender.toString(),
                    visitDate: data[index].visitDate.toString(),
                    totalReport: data[index].reportInfo.length.toString(),
                  ),
                );
              }),
      drawer: DrawerMenu(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: cViolet,
      title: Text(
        'ATI MediTop',
        //style: TextStyle(fontSize: 19),
      ),
      actions: [
        PopupMenuButton(
            icon: Icon(Icons.notifications),
            elevation: 20,
            enabled: true,
            onSelected: (PopupItem value) {
              setState(() {
                notificationInfo = value;
              });
              log(notificationInfo.name);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => RegistrationPage()));
            },
            itemBuilder: (context) {
              return _list.map((PopupItem choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice.name),
                );
              }).toList();
            })
      ],
    );
  }
}

class PopupItem {
  int value;
  String name;
  PopupItem(this.value, this.name);
}
