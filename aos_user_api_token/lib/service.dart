import 'dart:developer';

import 'package:http/http.dart' as http;

import 'model.dart';

class Webservice {
  Future fetchPosts() async {
    String url = "https://aos-tv.herokuapp.com/api/v1/admin/get-users";

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-auth-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MGZlZjUzYWU5NGM3NjAwMTViZGM4ZTIiLCJpYXQiOjE2Mjc0NjA4OTMsImV4cCI6MTYyODA2NTY5M30.e5iKNPq_rlo-pzbVlUC4iE23qrEB-9Jig5dalwktt3I',
      },
    );
    if (response.statusCode == 200) {
      log(response.body);
      return userDataFromJson(response.body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
