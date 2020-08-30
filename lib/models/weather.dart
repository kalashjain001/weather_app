import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  final String main;
  final String cityName;
  final coordLon;
  final coordLat;
  final temp;
  final feelsLike;
  final visibilty;
  final pressure;
  final humidity;
  final minTemp;
  final maxTemp;
  final String sunRise;
  final String sunSet;
  final String mainIcon;
  final String country;

  const Weather({
    this.main,
    this.cityName,
    this.coordLon,
    this.coordLat,
    this.temp,
    this.feelsLike,
    this.visibilty,
    this.pressure,
    this.humidity,
    this.minTemp,
    this.maxTemp,
    this.sunRise,
    this.sunSet,
    this.mainIcon,
    this.country,
  });

  @override
  List<Object> get props => [
    main,
    cityName,
    coordLon,
    coordLat,
    temp,
    main,
    visibilty,
    pressure,
    humidity,
    minTemp,
    maxTemp,
    sunRise,
    sunSet,
    mainIcon,
    country,
  ];

  static Weather fromJson(dynamic json){
    return Weather(
      cityName: json['name'],
      coordLon: json['coord']['lon'],
      coordLat: json['coord']['lat'],
      temp: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      visibilty: json['visibility'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      minTemp: json['main']['temp_min'],
      maxTemp: json['main']['temp_max'],
      sunRise: getClockInIst(json['sys']['sunrise']),
      sunSet: getClockInIst(json['sys']['sunset']),
      main: json['weather'][0]['main'],
      mainIcon: json['weather'][0]['icon'],
      country: json['sys']['country'],
    );
  }

  static String getClockInIst(int timeSinceEpochInSec) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
        isUtc: true)
        .add(const Duration(hours: 05, minutes: 30));
    String hour = time.hour.toString();
    String min = time.minute.toString();
    
    if(time.minute<10){
      min = '0$min';
    }
    if(time.hour>12){
      hour = '${time.hour-12}';
      return '$hour:$min PM';
    }

    return '$hour:$min AM';
  }

}