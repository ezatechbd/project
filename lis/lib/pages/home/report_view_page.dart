import 'package:ati_lis/config/common_const.dart';
import 'package:ati_lis/model/report_model.dart';
import 'package:flutter/material.dart';
import 'patient_report_view/report_view.dart';

class ReportViewPage extends StatefulWidget {
  final Report patientInfo;
  final int indexNo;

  ReportViewPage({@required this.patientInfo, @required this.indexNo});

  @override
  _ReportViewPageState createState() => _ReportViewPageState();
}

class _ReportViewPageState extends State<ReportViewPage> {
  // List<Report> report = [];
  // List<Report> displayReport = [];
  // var isLoading = true;
  // final TextEditingController _controller = TextEditingController();
  // bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    var data = widget.patientInfo.patientReportInfo[widget.indexNo].reportInfo;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: cViolet,
        title: Text(
          'ATI MediTop',
          //style: TextStyle(fontSize: 19),
        ),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ReportView(
              date: data[index].date.toString(),
              reportTitle: data[index].reportTitle.toString(),
              id: data[index].reqId.toString(),
              status: data[index].status.toString(),
              pdfLink: data[index].pdfLink.toString(),
            );
          }),
    );
  }

  // buildAppBar() {
  //   return AppBar(
  //     brightness: Brightness.dark,
  //     backgroundColor: cViolet,
  //     title: !isSearching
  //         ? Text(
  //             'ATI MediTop',
  //             //style: TextStyle(fontSize: 19),
  //           )
  //         : TextField(
  //             controller: _controller,
  //             onSubmitted: (value) {
  //               if (value.isNotEmpty) {
  //                 _controller.clear();
  //               }
  //             },
  //             onChanged: (text) async {
  //               text = text.toLowerCase();

  //               setState(() {
  //                 displayReport = report.where((value) {
  //                   var reportTitle = value.reportTitle.toLowerCase();
  //                   var id = value.id.toString().toLowerCase();
  //                   var date = value.date.toString().toLowerCase();
  //                   return reportTitle.contains(text) ||
  //                       id.contains(text) ||
  //                       date.contains(text);
  //                 }).toList();
  //               });
  //             },
  //             style: TextStyle(color: Colors.white),
  //             decoration: InputDecoration(
  //               hintText: "Search Report Here",
  //               hintStyle: TextStyle(
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //     actions: <Widget>[
  //       Container(
  //         child: isSearching
  //             ? IconButton(
  //                 icon: Icon(Icons.arrow_back),
  //                 onPressed: () async {
  //                   _controller.text = "";
  //                   setState(() {
  //                     this.isSearching = false;
  //                     displayReport = report;
  //                   });
  //                 },
  //               )
  //             : IconButton(
  //                 icon: Icon(Icons.search),
  //                 onPressed: () {
  //                   setState(() {
  //                     this.isSearching = true;
  //                   });
  //                 },
  //               ),
  //       ),
  //     ],
  //   );
  // }
}
