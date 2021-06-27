// To parse this JSON data, do
//
//     final report = reportFromJson(jsonString);

import 'dart:convert';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
  Report({
    this.patientReportInfo,
  });

  List<PatientReportInfo> patientReportInfo;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        patientReportInfo: List<PatientReportInfo>.from(
            json["patientReportInfo"]
                .map((x) => PatientReportInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patientReportInfo":
            List<dynamic>.from(patientReportInfo.map((x) => x.toJson())),
      };
}

class PatientReportInfo {
  PatientReportInfo({
    this.pId,
    this.name,
    this.gender,
    this.reportInfo,
    this.visitDate,
  });

  String pId;
  String name;
  String gender;
  String visitDate;
  List<ReportInfo> reportInfo;

  factory PatientReportInfo.fromJson(Map<String, dynamic> json) =>
      PatientReportInfo(
        pId: json["pId"],
        name: json["name"],
        gender: json["gender"],
        visitDate: json["visitDate"],
        reportInfo: List<ReportInfo>.from(
            json["reportInfo"].map((x) => ReportInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pId": pId,
        "name": name,
        "gender": gender,
        "visitDate": visitDate,
        "reportInfo": List<dynamic>.from(reportInfo.map((x) => x.toJson())),
      };
}

class ReportInfo {
  ReportInfo({
    this.reqId,
    this.date,
    this.reportTitle,
    this.status,
    this.pdfLink,
  });

  String reqId;
  String date;
  String reportTitle;
  String status;
  String pdfLink;

  factory ReportInfo.fromJson(Map<String, dynamic> json) => ReportInfo(
        reqId: json["reqId"],
        date: json["date"],
        reportTitle: json["reportTitle"],
        status: json["status"],
        pdfLink: json["pdfLink"],
      );

  Map<String, dynamic> toJson() => {
        "reqId": reqId,
        "date": date,
        "reportTitle": reportTitle,
        "status": status,
        "pdfLink": pdfLink,
      };
}
