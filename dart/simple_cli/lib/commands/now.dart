import 'package:simple_cli/commands/command.dart';
import 'package:simple_cli/model/model.dart';

class NowCommand extends WeatherCommand {
  @override
  final name = 'now';
  @override
  final description = 'Prints current weather in the given city.';
  @override
  final loadingMessage = 'looking for the current weather in';

  @override
  Future<List<Weather>> getWeather(String cityName) async {
    var weatherList = await WeatherCommand.api.getWeather(cityName);
    return [weatherList[0]];
  }
}
