import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:simple_cli/api/api.dart';
import 'package:simple_cli/model/model.dart';

abstract class WeatherCommand extends Command {
  String loadingMessage;
  static WeatherApi api = WeatherApi();

  Future<List<Weather>> getWeather(String cityName);

  @override
  Future<void> run() async {
    if (argResults.arguments.isEmpty) {
      throw Exception('City argument is required');
    }

    final cityName = argResults.arguments[0];
    final loadingString = loadingMessage + ' $cityName';

    stdout.write('$loadingString\n');
    var weather = await getWeather(cityName);
    stdout.writeAll(weather);
  }
}
