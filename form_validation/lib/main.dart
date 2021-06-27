import 'dart:developer';
import 'package:flutter/material.dart';
import 'model.dart';
import 'services.dart';
import 'dart:math' as math;

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  List<FormValidation> formData = [];
  List<FormValidation> checkUserName = [];
  List<FormValidation> checkUserAge = [];
  List<FormValidation> checkUserBirthDay = [];
  List<FormValidation> checkUserBirthMonth = [];
  List<FormValidation> checkUserBirthYear = [];
  List<FormValidation> checkUserAddress = [];
  List<FormValidation> checkUserMobile = [];
  List<FormValidation> checkUserEmail = [];
  List<FormValidation> checkUserNid = [];
  List<FormValidation> checkUserDepartment = [];
  List<FormValidation> checkUserRank = [];
  List<FormValidation> checkUserJobStatus = [];
  List<FormValidation> checkUserWorkPlace = [];
  List<FormValidation> checkUserPassword = [];

  var isLoading = true;

  @override
  void initState() {
    Webservice().fetchCountries().then((data) {
      setState(() {
        formData = data;
        isLoading = false;
        checkUserName = data.where((value) => value.fuid == 'FNM01').toList();
        checkUserAge = data.where((value) => value.fuid == 'FNM02').toList();
        checkUserBirthDay =
            data.where((value) => value.fuid == 'FNM03').toList();
        checkUserBirthMonth =
            data.where((value) => value.fuid == 'FNM04').toList();
        checkUserBirthYear =
            data.where((value) => value.fuid == 'FNM05').toList();
        checkUserAddress =
            data.where((value) => value.fuid == 'FNM06').toList();
        checkUserMobile = data.where((value) => value.fuid == 'FNM07').toList();
        checkUserEmail = data.where((value) => value.fuid == 'FNM08').toList();
        checkUserNid = data.where((value) => value.fuid == 'FNM09').toList();
        checkUserDepartment =
            data.where((value) => value.fuid == 'FNM10').toList();
        checkUserRank = data.where((value) => value.fuid == 'FNM11').toList();
        checkUserJobStatus =
            data.where((value) => value.fuid == 'FNM12').toList();
        checkUserWorkPlace =
            data.where((value) => value.fuid == 'FNM13').toList();
        checkUserPassword =
            data.where((value) => value.fuid == 'FNM14').toList();
      });
      log(checkUserAge[0].iSEnable.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: formData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(0.5), //random color for each child
                  // color: Colors.primaries[Random().nextInt(Colors.primaries.length)].withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formData[index]?.filedName.toString(),
                      ),
                      checkUserName[0].iSEnable == 0
                          ? Text('ki miya! kaj kore ni?')
                          : Container(
                              child: Text(formData[index].fuid),
                            ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
