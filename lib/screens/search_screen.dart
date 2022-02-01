import 'package:flutter/material.dart';
import 'package:weathernow/data_service/api/api.dart';
import 'package:weathernow/models/weather_model.dart';
import '../componaent/componant.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();

//  DataService _dataService = DataService();
  // WeatherResponse? _response;
  Api api = Api();
  WeatherModel? responseModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? temp = responseModel?.main?.temp;
    int? newTemp = temp?.toInt();
    String? icon = responseModel?.weather?[0].icon;
    String? description = responseModel?.weather?[0].description;
    String? name = responseModel?.name;
    String? country = responseModel?.sys?.country;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather\'s ToDay',
        ),
      ),
      body: Container(
        height: double.infinity,
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
                // if (responseModel != null)
                Text(
                  newTemp != null ? '${newTemp}°' : " ",
                  // '${_response?.tempeInfo.temperature}°',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),

                responseModel != null
                    ? Image.network(
                        'http://openweathermap.org/img/wn/${icon}@2x.png',
                      )
                    : Container(),
                Text(
                  description != null ? '${description}' : " ",
                  //  '${_response?.weatherInfo.description}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name != null ? '${name}' : " ",
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
                // Text(
                //   responseModel?.name != null ? '${responseModel?.name}' : " ",
                //   // '${_response?.cityName}',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                // ),
                // Image.network(_response.iconUrl),

                //...........
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 40,
                ),
                defaultTextFromField(
                  controller: _controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Search Must Not Be Empty';
                    } else {
                      return null;
                    }
                  },
                  labelText: 'City',
                  prefixIcon: Icon(Icons.account_balance_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(9)),
                    child: ElevatedButton(
                        onPressed: () {
                          _search();
                        },
                        child: const Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _search() async {
    var city = _controller.text;
    // final response = await _dataService.getWeather(city);
    final newResponse = await api.getWeather(city);
    _controller.clear();
    setState(() {
      //_response = response;
      responseModel = newResponse;
    });
  }
}
