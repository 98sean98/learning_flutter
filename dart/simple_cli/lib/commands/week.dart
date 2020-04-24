import 'package:simple_cli/commands/command.dart';
import 'package:simple_cli/model/model.dart';

class WeekCommand extends WeatherCommand {
  @override
  final name = 'week';
  @override
  final description = 'Prints weather for the week in the given city.';
  @override
  final loadingMessage = 'looking for the weekly weather in';

  @override
  Future<List<Weather>> getWeather(String cityName) async {
    return await WeatherCommand.api.getWeather(cityName);
  }
}
