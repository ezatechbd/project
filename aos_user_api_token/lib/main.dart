import 'package:flutter/material.dart';

import 'model.dart';
import 'service.dart';

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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserData userdata = new UserData();
  var isLoading = true;

  @override
  void initState() {
    Webservice().fetchPosts().then((data) {
      setState(() {
        userdata = data;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Api Data'),
      ),
      body: Center(
        child: Container(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: userdata.data.result.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(userdata.data.result[index].fullName);
                  }),
        ),
      ),
    );
  }
}
