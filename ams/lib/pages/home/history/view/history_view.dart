import 'package:ati_ams/config/common_const.dart';
import 'package:ati_ams/widgets/custom_timeline.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  final String date, startTime, endTime;
  const HistoryView({
    Key key,
    @required this.date,
    @required this.startTime,
    @required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // top: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Row(
        children: [
          CustomTimeLine(height: 65),
          SizedBox(width: 8.0),
          Expanded(
            child: Container(
              height: 65,
              width: double.infinity,
              child: Card(
                // margin: EdgeInsets.only(bottom: 8),
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            startTime,
                            style: TextStyle(
                              color: cViolet,
                            ),
                          ),
                          Text(
                            endTime,
                            style: TextStyle(
                              color: cViolet,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
