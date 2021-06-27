import 'package:ati_lis/model/report_model.dart';
import 'package:ati_lis/services/report_service.dart';
import 'package:flutter/material.dart';
import 'package:ati_lis/config/common_const.dart';
import 'package:ati_lis/custom/drawer/drawer_menu.dart';
import 'package:flutter/services.dart';
import 'patient_report_view/patient_view.dart';
import 'report_view_page.dart';
import 'dart:ui';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Report patientInfo = new Report();
  var isLoading = true;

  @override
  void initState() {
    Webservice().fetchPosts().then((data) {
      setState(() {
        patientInfo = data;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = patientInfo.patientReportInfo;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: cViolet,
        title: Text(
          'ATI MediTop',
          //style: TextStyle(fontSize: 19),
        ),
      ),
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
}
