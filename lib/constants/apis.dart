import 'dart:convert';

import 'package:http/http.dart' as http;

class APIConfig {
  static const String appId = '6234c794';
  static const String appKey = 'b2da4fddbcba5f6fb993db47328548c1';
  static const String query = 'biryani';
  static const String url =
      'https://api.edamam.com/search?q=$query&app_id=$appId&app_key=$appKey&to=1';
  void callApi() async {
    var uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      var stringResponse = response.body;
      Map<String, dynamic> parsedJson = jsonDecode(stringResponse);
      print(parsedJson['hits'][0]['recipe']['dietLabels']);
    } catch (e) {}
  }
}
