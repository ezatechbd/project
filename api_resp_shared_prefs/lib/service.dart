import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';

class Webservice {
  Future fetchPosts() async {
    String url =
        "https://raw.githubusercontent.com/ezatechbd/data/master/patient_report.json";

    final response = await http.get(url);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      prefs.setString('apiresp', response.body);
      return reportFromJson(response.body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
