import 'dart:convert';
import 'dart:developer';
import 'package:ati_ams/model/geodata_model.dart';
import 'package:ati_ams/services/geodata_service.dart';
import 'package:ati_ams/widgets/attendance_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/dashboard_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map apiResp = {};
  bool isLoading = true;
  GeoDataModel geoData = new GeoDataModel();
  String institutionCode;
  @override
  void initState() {
    getRespFromSP().then((data) {
      setState(() {
        apiResp = data['data']['user_info'];
      });
    }).then((value) {
      String institutionCodeSP = institutionCode.toString() == 'null'
          ? 'BIRDEM_01'
          : institutionCode.toString();
      log('dashboard_page: $institutionCodeSP');
      GeoDataService().fetchGeoData(institutionCodeSP).then((value) {
        setState(() {
          geoData = value;
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  Future getRespFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiResp = json.decode(prefs.getString('apiresp'));
    institutionCode = prefs.getString('institution');
    return apiResp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   brightness: Brightness.dark,
        //   backgroundColor: Color(PrimaryColor),
        //   title: Text('Dashboard'),
        // ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : DashboardTile(
                name: apiResp['students_name'].toString(),
                id: apiResp['stu_id'].toString(),
                department: apiResp['department'].toString(),
                gender: apiResp['gender'].toString(),
                dateOfBirth: apiResp['date_of_birth']
                    .toString()
                    .split('00:00:00')[0]
                    .toString(),
                onTapAttendance: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AttendanceDialog(
                        alertText: "Would you like to attend in this event?",
                        geoData: geoData.data,
                        department: apiResp['department'].toString(),
                        courseType: "",
                        courseName: "",
                        attendanceType: "A",
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
