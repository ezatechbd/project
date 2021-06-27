import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp]); //lock device orientation
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: email == null ? LoginPage(email: email.toString()) : MyHomePage(),
      home: LoginPage(email: email.toString()),
    ),
  );
}
