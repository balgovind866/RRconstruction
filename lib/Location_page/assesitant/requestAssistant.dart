import 'dart:convert';

import 'package:http/http.dart' as http;
class RequestAssistant
{

  static Future<dynamic> getrequest(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        String jsondata = response.body;
        var decodedata = jsonDecode(jsondata);
        print(response.body);
        return decodedata;

      }
      else {
        print('error');
        return 'Failed';
      }
    }
    catch (e) {
      return 'Failed';

    }
  }

}