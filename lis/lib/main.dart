import 'dart:developer';

import 'package:ati_lis/pages/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/fcm_utils.dart';
import 'pages/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp]); //lock device orientation
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  var otp = prefs.getString('otp');
  var workPlace = prefs.getString('workPlace');
  var saveUser = prefs.getString('saveUser');
  log("email: $email");
  log("otp: $otp");
  log("workPlace: $workPlace");
  log("saveUser: $saveUser");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: email == null
      //     ? OTPVerification(email: email.toString())
      //     : LoginPage(email: email.toString()),
      home: (saveUser.toString() == 'null' ||
              email.toString() == 'null' ||
              otp.toString() == 'null')
          ? LoginPage()
          : MyHomePage(),
    ),
  );
}
