// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.isSuccess,
    this.msg,
    this.data,
  });

  bool isSuccess;
  String msg;
  Data data;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        isSuccess: json["isSuccess"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.result,
    this.currentPage,
    this.limitPerPage,
    this.totalItem,
    this.pages,
  });

  List<Result> result;
  int currentPage;
  int limitPerPage;
  int totalItem;
  int pages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        currentPage: json["currentPage"],
        limitPerPage: json["limitPerPage"],
        totalItem: json["totalItem"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "currentPage": currentPage,
        "limitPerPage": limitPerPage,
        "totalItem": totalItem,
        "pages": pages,
      };
}

class Result {
  Result({
    this.fullName,
    this.maxDevice,
    this.status,
    this.userType,
    this.accessList,
    this.appList,
    this.creator,
    this.credit,
    this.id,
    this.userName,
    this.createdAt,
    this.updatedAt,
  });

  String fullName;
  int maxDevice;
  bool status;
  String userType;
  List<dynamic> accessList;
  List<dynamic> appList;
  String creator;
  int credit;
  String id;
  String userName;
  DateTime createdAt;
  DateTime updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        fullName: json["fullName"],
        maxDevice: json["maxDevice"],
        status: json["status"],
        userType: json["userType"],
        accessList: List<dynamic>.from(json["accessList"].map((x) => x)),
        appList: List<dynamic>.from(json["appList"].map((x) => x)),
        creator: json["creator"] == null ? null : json["creator"],
        credit: json["credit"],
        id: json["_id"],
        userName: json["userName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "maxDevice": maxDevice,
        "status": status,
        "userType": userType,
        "accessList": List<dynamic>.from(accessList.map((x) => x)),
        "appList": List<dynamic>.from(appList.map((x) => x)),
        "creator": creator == null ? null : creator,
        "credit": credit,
        "_id": id,
        "userName": userName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
