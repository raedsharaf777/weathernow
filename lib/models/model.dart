/*{
 "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
 "main": {
    "temp": 282.55,

    "temp_min": 280.37,
    "temp_max": 284.26,
},
  "sys": {
     "country": "US",
  },
  "name": "Mountain View",
 }  */

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;

  final TemperatureInfo tempeInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempeInfo,
      required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempeInfo = TemperatureInfo.fromJson(json['main']);
    final weatherInfo = WeatherInfo.fromJson(json['weather'][0]);

    return WeatherResponse(
        cityName: cityName, tempeInfo: tempeInfo, weatherInfo: weatherInfo);
  }
}
