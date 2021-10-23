import 'package:ati_ams/config/common_const.dart';
import 'package:ati_ams/model/event_model.dart';
import 'package:http/http.dart' as http;

class EventService {
  Future fetchEventData() async {
    String extUrl = 'get_events';
    Uri url = Uri.parse(baseUrl + extUrl);
    // String url = "http://192.168.0.89:8000/birdem-ams/api/get_events";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      // log(response.body);
      print('Event Info Request Successful!!!');
      return eventModelFromJson(response.body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
