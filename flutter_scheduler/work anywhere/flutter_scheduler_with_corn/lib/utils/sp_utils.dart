import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<bool> setTitle(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('title', value);
  }

  Future<String> getTitle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('title');
  }

  Future<bool> setDescription(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('description', value);
  }

  Future<String> getDescription() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('description');
  }
}
