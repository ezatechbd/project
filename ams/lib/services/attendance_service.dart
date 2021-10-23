import 'package:ati_ams/config/common_const.dart';
import 'package:ati_ams/model/attendance_model.dart';
import 'package:http/http.dart' as http;

class AttendanceService {
  Future fetchAttendanceData() async {
    String extUrl = 'class_routine';
    Uri url = Uri.parse(baseUrl + extUrl);
    // String url = "http://192.168.0.89:8000/birdem-ams/api/class_routine";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      // log(response.body);
      print('Class Info Request Successful!!!');
      return attendanceModelFromJson(response.body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
