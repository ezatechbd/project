import 'dart:convert';

import 'package:api_resp_shared_prefs/service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Report blogPost = new Report();
  var isLoading = true;
  Map apiresp;
  @override
  void initState() {
    Webservice().fetchPosts().then((data) {
      setState(() {
        blogPost = data;
        isLoading = false;
        getRespFromSP();
      });
    });
    super.initState();
  }

  getRespFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiresp = json.decode(prefs.getString('apiresp'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Resp To SP'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  print(apiresp);
                  print(apiresp['patientReportInfo'][0]['name'].toString());
                },
                child: Text('click to print sp value'),
              ),
            ),
    );
  }
}
