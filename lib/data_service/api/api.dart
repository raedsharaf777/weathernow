import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weathernow/data_service/location/location.dart';
import 'package:weathernow/models/model.dart';
import 'package:weathernow/models/weather_model.dart';
import 'package:weathernow/screens/home_screen.dart';

import '../network/network_helper.dart';

class Api {
  Future<WeatherModel> getWeather(String cityName) async {
//api.openweathermap.org/data/2.5/weather?q=mansoura&appid=
    //2c14cdbcdb3ac13610f3088a6924c6b2
    final queryParameter = {
      'q': cityName,
      'appid': '2c14cdbcdb3ac13610f3088a6924c6b2',
      'units': 'metric',
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
    return WeatherModel.fromJson(json);
  }

  //............................................................................
  static getLocationNow(context) async {
    // Get Location(Position)
    Location location = Location();
    await location.getLocation();
    double? lat = location.latitude;
    double? lon = location.longitude;

    // get json
//api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid={API key

    final uri = Uri.http(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '${lat}',
        'lon': '${lon}',
        'appid': '2c14cdbcdb3ac13610f3088a6924c6b2',
        'units': 'metric',
      },
    );
    final response = await http.get(uri);
    print(response.body);
    final json = jsonDecode(response.body);
    var weatherModel = WeatherModel.fromJson(json);

    // navigate data to HomeScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          weatherResponse: weatherModel,
        ),
      ),
    );
  }

  //............................................................................
  getCurrentLocation(context) async {
    // get Location
    Location location = Location();
    await location.getLocation();
    print(location.latitude);
    print(location.longitude);
    await location.getLocation();
    // Get Json Data
    String uri =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=2c14cdbcdb3ac13610f3088a6924c6b2';
    NetWorkHelper helper = NetWorkHelper(uri: uri);
    var weatherData = await helper.getData();

    //Get SpinKit HomeScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          weatherResponse: weatherData,
        ),
      ),
    );
  }
}
