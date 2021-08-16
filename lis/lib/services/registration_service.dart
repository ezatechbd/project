import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

int statusCode;

Future sumbitRegistrationData(
    String name,
    String nID,
    String mobileNo,
    String email,
    String presentAddr,
    String permanentAddr,
    String genderID,
    String religionID,
    String maritialID,
    String bloodGrpID,
    String birthDate,
    int ageDay,
    int ageMonth,
    int ageYear,
    int onService,
    String currentWorkUnit,
    String rankID) async {
  int religionIDVal = int.parse(religionID);
  int rankIDVal = int.parse(rankID);
  Map data = {
    "REG_REQ_ID": 0,
    "REQSTER_NM": name,
    "SORGNDR_NO": genderID,
    "DTOF_BIRTH": birthDate,
    "NOF_AGE_YY": ageYear,
    "NOF_AGE_MM": ageMonth,
    "NOF_AGE_DD": ageDay,
    "RELGION_ID": religionIDVal,
    "MSTATUS_ID": maritialID,
    "NATIONALID": nID,
    "BIRTHREGNO": "",
    "BLD_GRP_NO": bloodGrpID,
    "CMOBILE_NO": mobileNo,
    "PASPORT_NO": "",
    "EMAIL_ADDR": email,
    "PRES_ADDRS": presentAddr,
    "PERM_ADDRS": permanentAddr,
    "ONSERVICE": onService,
    "CURRENTWORKUNIT": currentWorkUnit,
    "RANK_ID": rankIDVal,
    "ANY_REMARK": "",
    "PHOTO_LOCA": ""
  };
  var body = json.encode(data);
  String url = 'http://192.168.0.95:8088/ords/ordstest/cmh/reg/';

  final http.Response response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: body,
  );
  log(response.body);
  log(body);
  statusCode = response.statusCode;
  if (response.statusCode == 200 &&
      response.body != null &&
      response.body.isNotEmpty) {
    print('Registration successful!!!');
    return jsonDecode(response.body);
  } else {
    log('Registration failed');
    // log(response.statusCode.toString());
    // return jsonDecode(response.body);
  }
}
