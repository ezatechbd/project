import 'dart:developer';
import 'package:ati_ams/config/common_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

var checkInOutDayVal = ValueNotifier<String>('null');

class SendAttendanceInfo {
  Future sendAttendance({
    @required String department,
    @required String courseType,
    @required String courseName,
    @required String attendanceType,
    @required String currentLat,
    @required String currentLng,
  }) async {
    Map data = {
      "department": department,
      "course_type": courseType,
      "course_name": courseName,
      "attendance_type": attendanceType,
      "lat": currentLat,
      "lng": currentLng,
      "class_routine_id": "0",
      "attendance_status": "1",
      "activity": "0"
    };
    var body = json.encode(data);
    String extUrl = 'stu_attendance';
    Uri url = Uri.parse(baseUrl + extUrl);
    // String url = 'http://192.168.0.89:8000/birdem-ams/api/stu_attendance';

    final http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    log(response.body);
    log(body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dayToday = attendanceType == 'A'
        ? DateTime.now().day.toString()
        : prefs.getString('checkInOutDay');
    if (response.statusCode == 200 &&
        response.body != null &&
        response.body.isNotEmpty) {
      prefs.setString('checkInOutDay',
          dayToday); // set day to to check institute in/out condition
      checkInOutDayVal.value = dayToday;
      print('Send Attendance Succesfully!!!');
      return jsonDecode(response.body);
    } else {
      log('Failed to send attendance!!!');
      // log(response.statusCode.toString());
      // return jsonDecode(response.body);
    }
  }
}
