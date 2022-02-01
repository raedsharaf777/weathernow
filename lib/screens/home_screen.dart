import 'package:flutter/material.dart';
import 'package:weathernow/models/weather_model.dart';
import 'package:weathernow/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);
  var weatherResponse;

  HomeScreen({this.weatherResponse});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? weatherModel;
  double? temp;
  int newTemp = 0;
  String? description;
  String? icon;
  String? country;
  String? name;

  void updateUI(weatherResponse) async {
    weatherModel = weatherResponse;
    temp = weatherModel?.main?.temp;
    newTemp = temp!.toInt();
    description = weatherModel?.weather?[0].description;
    icon = weatherModel?.weather?[0].icon;
    country = weatherModel?.sys?.country;
    name = weatherModel?.name;
    print(weatherResponse);
  }

  @override
  void initState() {
    updateUI(widget.weatherResponse);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('weather in my city'),
        leading: Icon(Icons.brightness_4_outlined),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade900,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '${newTemp}°',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                weatherModel != null
                    ? Image.network(
                        'http://openweathermap.org/img/wn/${icon}@2x.png',
                      )
                    : Container(),
                Text(
                  weatherModel?.weather?[0].description != null
                      ? '${description}'
                      : " ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherModel?.name != null ? '${name}' : " ",
                      // '${_response?.cityName}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      country != null ? '${country}' : " ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Go To Search',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
