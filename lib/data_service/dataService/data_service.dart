import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathernow/models/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String cityName) async {
//api.openweathermap.org/data/2.5/weather?q=%D9%85%D9%8A%D8%AA%20%D8%BA%D9%85%D8%B1&appid=2c14cdbcdb3ac13610f3088a6924c6b2
    final queryParameter = {
      'q': cityName,
      'appid': '2c14cdbcdb3ac13610f3088a6924c6b2',
      'units': 'imperial',
    };
    final uri = Uri.http(
      'api.openweathermap.org',
      '/data/2.5/weather',
      queryParameter,
    );
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
