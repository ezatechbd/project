import 'dart:developer';

import 'package:ati_ams/config/common_const.dart';
import 'package:ati_ams/model/event_model.dart';
import 'package:ati_ams/model/geodata_model.dart';
import 'package:ati_ams/services/event_service.dart';
import 'package:ati_ams/services/geodata_service.dart';
import 'package:ati_ams/widgets/attendance_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/event_view.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  var isLoading = true;
  EventModel eventData = new EventModel();
  GeoDataModel geoData = new GeoDataModel();
  String institutionCode;

  @override
  void initState() {
    EventService().fetchEventData().then((data) {
      setState(() {
        eventData = data;
      });
    }).then((value) {
      getRespFromSP().then((value) {
        String institutionCodeSP = institutionCode.toString() == 'null'
            ? 'BIRDEM_01'
            : institutionCode.toString();
        log('event_page: $institutionCodeSP');
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
        title: Text('Events'),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : eventData.data.isEmpty
              ? Center(
                  child: Text('No events found!'),
                )
              : ListView.builder(
                  itemCount: eventData.data.length,
                  itemBuilder: (context, index) {
                    var eventInfo = eventData.data[index];
                    return ActivityTile(
                      name: eventInfo.title.toString(),
                      topic: eventInfo.topicName.toString(),
                      authorizedBy: 'Birdem General Hospital',
                      date: eventInfo.start
                          .toString()
                          .split('00:00:00')[0]
                          .toString(),
                      address: '122 Kazi Nazrul Islam Ave, Dhaka 1000',
                      duration: '1.30 hours',
                      onTapAttendance: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AttendanceDialog(
                              alertText:
                                  "Would you like to attend in this event?",
                              geoData: geoData.data,
                              department: eventInfo.department.toString(),
                              courseType: eventInfo.datumCourseName.toString(),
                              courseName: eventInfo.datumCourseType.toString(),
                              attendanceType: "A",
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
