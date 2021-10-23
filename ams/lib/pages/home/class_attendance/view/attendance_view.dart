import 'package:ati_ams/config/common_const.dart';
import 'package:ati_ams/pages/home/event/view/event_item_view.dart';
import 'package:flutter/material.dart';

class AttendanceTile extends StatelessWidget {
  final String department;
  final String classTopic;
  final String instructor;
  final String date;
  final String duration;
  final Function onTapAttendance;

  AttendanceTile({
    @required this.department,
    @required this.classTopic,
    @required this.instructor,
    @required this.duration,
    @required this.date,
    @required this.onTapAttendance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: <Color>[
          //     Colors.primaries[Random().nextInt(Colors.primaries.length)],
          //     // Colors.primaries[Random().nextInt(Colors.primaries.length)]
          //     //     .withOpacity(0.1),
          //     // Colors.primaries[Random().nextInt(Colors.primaries.length)],
          //     Colors.blueGrey,
          //   ],
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(10, 10), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                width: MediaQuery.of(context).size.width - 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      department,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 8),
                    Divider(color: cViolet),
                    ActivityItemView(
                      title: classTopic,
                      icon: Icons.topic,
                      iconColor: Colors.purple,
                    ),
                    ActivityItemView(
                      title: 'Instructed by ${instructor.toUpperCase()}',
                      icon: Icons.person,
                      iconColor: Colors.blue,
                    ),
                    ActivityItemView(
                      title: date,
                      icon: Icons.calendar_today,
                      iconColor: Colors.red,
                    ),
                    ActivityItemView(
                      title: duration,
                      icon: Icons.timelapse,
                      iconColor: cViolet,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 2.0),
              child: InkWell(
                onTap: () {
                  onTapAttendance();
                },
                child: Column(
                  children: [
                    Text('08-10-2021'),
                    Icon(
                      Icons.fingerprint,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text('10:30 AM'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
