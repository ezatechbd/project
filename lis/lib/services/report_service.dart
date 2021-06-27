import 'package:ati_lis/model/report_model.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future fetchPosts() async {
    String url =
        "https://raw.githubusercontent.com/ezatechbd/data/master/patient_report.json";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return reportFromJson(response.body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
