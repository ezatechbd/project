import 'dart:developer';

import 'package:ati_ams/config/common_const.dart';
import 'package:ati_ams/model/attendance_model.dart';
import 'package:ati_ams/model/geodata_model.dart';
import 'package:ati_ams/services/attendance_service.dart';
import 'package:ati_ams/services/geodata_service.dart';
import 'package:ati_ams/widgets/attendance_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/attendance_view.dart';

class ClassAttendancePage extends StatefulWidget {
  const ClassAttendancePage({Key key}) : super(key: key);

  @override
  _ClassAttendancePageState createState() => _ClassAttendancePageState();
}

class _ClassAttendancePageState extends State<ClassAttendancePage> {
  var isLoading = true;
  AttendanceModel attendanceData = new AttendanceModel();
  GeoDataModel geoData = new GeoDataModel();
  String institutionCode;

  @override
  void initState() {
    AttendanceService().fetchAttendanceData().then((data) {
      setState(() {
        attendanceData = data;
        // isLoading = false;
      });
    }).then((value) {
      getRespFromSP().then((value) {
        String institutionCodeSP = institutionCode.toString() == 'null'
            ? 'BIRDEM_01'
            : institutionCode.toString();
        log('class_page: $institutionCodeSP');
        GeoDataService().fetchGeoData(institutionCodeSP).then((value) {
          setState(() {
            geoData = value;
            isLoading = false;
          });
        });
      });
    });
    super.initState();
  }

  Future getRespFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    institutionCode = prefs.getString('institution');
    return institutionCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeaf4ff),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(PrimaryColor),
        title: Text('Class Attendance'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : attendanceData.data.isEmpty
              ? Center(
                  child: Text('No classes found!'),
                )
              : ListView.builder(
                  itemCount: attendanceData.data.length,
                  itemBuilder: (context, index) {
                    var attendanceInfo = attendanceData.data[index];
                    String classStartDate = DateFormat('dd-MM-yyyy')
                        .format(attendanceInfo.classStartDate)
                        .toString();
                    String classStartTime = DateFormat.jm()
                        .format(attendanceInfo.classStartTime)
                        .toString();
                    String classEndTime = DateFormat.jm()
                        .format(attendanceInfo.classEndTime)
                        .toString();
                    return AttendanceTile(
                      department: attendanceInfo.deptName.toString(),
                      classTopic: 'Chronic noncommunicable diseases (NCDs)',
                      instructor: 'Dr. Mohammad Saifur Rahman',
                      date: classStartDate.toString(),
                      duration:
                          '${classStartTime.toString()} - ${classEndTime.toString()}',
                      onTapAttendance: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AttendanceDialog(
                              alertText:
                                  "Would you like to attend in this event?",
                              geoData: geoData.data,
                              department:
                                  attendanceInfo.departmentId.toString(),
                              courseType: attendanceInfo.courseType.toString(),
                              courseName:
                                  attendanceInfo.courseNameId.toString(),
                              attendanceType: "C",
                            );
                          },
                        );
                      },
                    );
                  },
                ),
    );
  }
}
