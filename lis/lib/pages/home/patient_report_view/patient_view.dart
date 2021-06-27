import 'package:ati_lis/config/common_const.dart';
import 'package:flutter/material.dart';

class PatientView extends StatefulWidget {
  final String patientName;
  final String pId;
  final String gender;
  final String visitDate;
  final String totalReport;

  PatientView({
    @required this.patientName,
    @required this.pId,
    @required this.gender,
    @required this.visitDate,
    @required this.totalReport,
  });

  @override
  _PatientViewState createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          // height: 150,
          width: width,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.patientName,
                    style: TextStyle(
                      color: textBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                        text: 'ID NO: ',
                        style: TextStyle(
                          color: textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: widget.pId,
                            style: TextStyle(
                                color: textBlack, fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                        text: 'Gender: ',
                        style: TextStyle(
                          color: textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: widget.gender,
                            style: TextStyle(
                                color: textBlack, fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                        text: 'Date: ',
                        style: TextStyle(
                          color: textBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: widget.visitDate,
                            style: TextStyle(
                                color: textBlack, fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: -12,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 55,
            width: 130,
            child: Card(
              color: cViolet,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  "Total report: ${widget.totalReport}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
