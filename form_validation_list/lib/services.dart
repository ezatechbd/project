import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class Webservice {
  Future<List<FormValidation>> fetchCountries() async {
    String url =
        "https://raw.githubusercontent.com/ezatechbd/data/master/form_validation.json";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      //print(body);
      final Iterable json = body;
      return json.map((data) {
        return FormValidation.fromJson(
            data); // if you use "{}", you must use return
      }).toList();

      // if you use "=>", you don't need to use "return" like below
      // return json.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
