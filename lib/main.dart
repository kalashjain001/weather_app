import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/simple_bloc_observer.dart';
import 'package:http/http.dart' as http;

import 'widgets/app.dart';
import 'repositories/repositories.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(App(weatherRepository: weatherRepository));
}
