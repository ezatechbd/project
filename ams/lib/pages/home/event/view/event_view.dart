import 'package:ati_ams/config/common_const.dart';
import 'package:flutter/material.dart';
import 'event_item_view.dart';

class ActivityTile extends StatelessWidget {
  final String name;
  final String topic;
  final String authorizedBy;
  final String date;
  final String address;
  final String duration;
  final Function onTapAttendance;

  ActivityTile({
    @required this.name,
    @required this.topic,
    @required this.authorizedBy,
    @required this.date,
    @required this.address,
    @required this.duration,
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
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 8),
                    Divider(color: cViolet),
                    ActivityItemView(
                      title: topic,
                      icon: Icons.topic,
                      iconColor: Colors.purple,
                    ),
                    ActivityItemView(
                      title: 'Authorized by ${authorizedBy.toUpperCase()}',
                      icon: Icons.present_to_all,
                      iconColor: Colors.blue,
                    ),
                    ActivityItemView(
                      title: date,
                      icon: Icons.calendar_today,
                      iconColor: Colors.red,
                    ),
                    ActivityItemView(
                      title: address,
                      icon: Icons.location_on,
                      iconColor: Colors.green,
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
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  onTapAttendance();
                },
                child: Icon(
                  Icons.fingerprint,
                  size: 70,
                  color: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
