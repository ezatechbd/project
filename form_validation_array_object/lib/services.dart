import 'package:http/http.dart' as http;
import 'model.dart';

class Webservice {
  Future fetchPosts() async {
    String url = "http://192.168.0.95:8088/ords/ordstest/tab/select/user";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      // log(response.body);
      return formValidationFromJson(response.body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
