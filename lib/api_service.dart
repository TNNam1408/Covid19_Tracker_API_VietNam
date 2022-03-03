import 'dart:convert';
import 'package:covid19_tracker_api_vietnam/vietnam_model.dart';
import 'package:http/http.dart' as http;

class FetchList {
  var data = [];
  List<Detail> results = [];
  String urlList = 'https://api.apify.com/v2/key-value-stores/ZsOpZgeg7dFS1rgfM/records/LATEST?fbclid=IwAR1UCKt-lM0mITqxyalzx-XdQ3cFYX51Il_7kU0X79sS5LDZwdIp7FFPAxg&utm_source=j2team&utm_medium=url_shortener';

  Future<List<Detail>> getList({String? query}) async {
    var url = Uri.parse(urlList);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body)['detail'];
        results = data.map((e) => Detail.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}