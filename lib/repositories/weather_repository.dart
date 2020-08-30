import 'dart:async';

import 'package:meta/meta.dart';

import 'package:weather_api/repositories/weather_api_client.dart';
import 'package:weather_api/models/models.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    return weatherApiClient.fetchWeather(city);
  }
}
