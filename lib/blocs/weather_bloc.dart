import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:weather_api/repositories/repositories.dart';
import 'package:weather_api/models/models.dart';
import 'package:weather_api/blocs/blocs.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (e) {
        print(e);
        yield WeatherLoadFailure();
      }
    }
  }
}
