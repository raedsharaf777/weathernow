import 'dart:convert';

import 'package:http/http.dart';

class NetWorkHelper {
  String uri;

  NetWorkHelper({required this.uri});

  Future<dynamic> getData() async {
    var decodeData=null;
    var url = Uri.parse(uri);
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      print('Json Data Id ----> $data');
       decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print('The response.statusCode---> ${response.statusCode}');
    }
    return decodeData;
  }
}
