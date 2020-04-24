import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_cli/model/model.dart';

class WeatherApi {
  static const ID_URL = 'https://www.metaweather.com/api/location/search/?query=[0]';
  static const API_URL = 'https://www.metaweather.com/api/location/[0]/';

  Future<int> getCityID(String cityName) async {
    var url = ID_URL.replaceAll('[0]', cityName);
    var res = await http.get(url);
    var json = jsonDecode(res.body);
    if ((json as List).isEmpty) {
      throw Exception('cannot find $cityName');
    }
    return json[0]['woeid'];
  }

  Future<List<Weather>> getWeather(String cityName) async {
    var id = await getCityID(cityName);
    var url = API_URL.replaceAll('[0]', id.toString());
    var res = await http.get(url);
    var json = jsonDecode(res.body);

    // ignore: omit_local_variable_types
    List<Weather> weather = [];
    (json['consolidated_weather'] as List<dynamic>).forEach((j) => weather.add(Weather.fromJSON(j)));

    return weather;
  }
}
