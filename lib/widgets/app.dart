import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/widgets/weather.dart';

import '../blocs/blocs.dart';
import '../repositories/weather_repository.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      home: BlocProvider(
        create: (context) =>
            WeatherBloc(weatherRepository: weatherRepository),
        child: Weather(),
      ),
    );
  }
}
