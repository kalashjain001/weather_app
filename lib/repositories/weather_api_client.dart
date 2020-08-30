import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:weather_api/models/models.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'api.openweathermap.org/data/2.5/weather';
  static const api = '8d90a8c36c95dea6d49d32c51bec21f6';

  final http.Client httpClient;

  WeatherApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Weather> fetchWeather(String city) async {

    final weatherUrl = 'http://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=8d90a8c36c95dea6d49d32c51bec21f6';
    final weatherResponse = await this.httpClient.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      print('error getting weather for location');
      throw Exception('error getting weather for location');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    print('${weatherJson['main']['temp']}');
    return Weather.fromJson(weatherJson);
  }
}
