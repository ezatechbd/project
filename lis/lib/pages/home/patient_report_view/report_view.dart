import 'package:ati_lis/config/common_const.dart';
import 'package:ati_lis/pages/home/pdf_viewer/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReportView extends StatefulWidget {
  final String date;
  final String reportTitle;
  final String id;
  final String status;
  final String pdfLink;

  ReportView({
    @required this.date,
    @required this.reportTitle,
    @required this.id,
    @required this.status,
    @required this.pdfLink,
  });

  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          // height: 150,
          width: width,
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: cSky,
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                colors: <Color>[
                  cViolet,
                  cSky,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.reportTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    widget.status == '1'
                        ? ButtonTheme(
                            height: 30,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PdfReader(
                                      pdflink: widget.pdfLink,
                                    ),
                                  ),
                                );
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'view',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.filePdf,
                                    color: cRed,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ButtonTheme(
                            height: 30,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.white54,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'pending',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
                // SizedBox(
                //   height: 5,
                // ),
                RichText(
                  text: TextSpan(
                      text: 'ID NO: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: widget.id,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ]),
                ),
                SizedBox(height: 15),
              ],
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
              color: cYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  widget.date,
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
