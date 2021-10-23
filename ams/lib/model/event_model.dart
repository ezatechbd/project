// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    this.success,
    this.message,
    this.data,
  });

  final bool success;
  final String message;
  final List<Datum> data;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.eventType,
    this.topic,
    this.title,
    this.department,
    this.datumCourseName,
    this.datumCourseType,
    this.batch,
    this.start,
    this.end,
    this.color,
    this.activeStatus,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.orgId,
    this.lookupDataName,
    this.deptName,
    this.courseType,
    this.courseName,
    this.topicName,
  });

  final int id;
  final int eventType;
  final int topic;
  final String title;
  final int department;
  final int datumCourseName;
  final int datumCourseType;
  final int batch;
  final DateTime start;
  final DateTime end;
  final dynamic color;
  final int activeStatus;
  final dynamic createdBy;
  final DateTime createdAt;
  final dynamic updatedBy;
  final dynamic updatedAt;
  final int orgId;
  final String lookupDataName;
  final String deptName;
  final String courseType;
  final String courseName;
  final String topicName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        eventType: json["event_type"],
        topic: json["topic"],
        title: json["title"],
        department: json["department"],
        datumCourseName: json["course_name"],
        datumCourseType: json["course_type"],
        batch: json["batch"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        color: json["color"],
        activeStatus: json["active_status"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedBy: json["updated_by"],
        updatedAt: json["updated_at"],
        orgId: json["org_id"],
        lookupDataName: json["LOOKUP_DATA_NAME"],
        deptName: json["DEPT_NAME"],
        courseType: json["COURSE_TYPE"],
        courseName: json["COURSE_NAME"],
        topicName: json["TOPIC_NAME"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_type": eventType,
        "topic": topic,
        "title": title,
        "department": department,
        "course_name": datumCourseName,
        "course_type": datumCourseType,
        "batch": batch,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "color": color,
        "active_status": activeStatus,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_by": updatedBy,
        "updated_at": updatedAt,
        "org_id": orgId,
        "LOOKUP_DATA_NAME": lookupDataName,
        "DEPT_NAME": deptName,
        "COURSE_TYPE": courseType,
        "COURSE_NAME": courseName,
        "TOPIC_NAME": topicName,
      };
}
