class Weather {
  double temperature;
  double minTemperature;
  double maxTemperature;
  String date;

  Weather(
      this.temperature, this.minTemperature, this.maxTemperature, this.date);

  Weather.fromJSON(Map<String, dynamic> json)
      : temperature = json['the_temp'],
        minTemperature = json['min_temp'],
        maxTemperature = json['max_temp'],
        date = json['applicable_date'];

  @override
  String toString() {
    return 'Date: $date, Temperature: ${temperature.toStringAsFixed(2)}C, Min. Temperature: ${minTemperature.toStringAsFixed(2)}C, Max. Temperature: ${maxTemperature.toStringAsFixed(2)}C\n';
  }
}
