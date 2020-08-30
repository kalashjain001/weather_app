import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_api/blocs/blocs.dart';
import 'package:weather_api/constants.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[400],
      body: Container(
        padding: EdgeInsets.only(top:50),
        //height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter City',
                hintStyle: TextStyle(
                  fontSize: 14,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  size: 20,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              style: TextStyle(
                fontSize: 14,
              ),
              onSubmitted: (city) {
                if (city != null) {
                  BlocProvider.of<WeatherBloc>(context)
                      .add(WeatherRequested(city: city));
                }
              },
            ),
            //Spacer(),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return Expanded(
                    child: Container(
                      child: Center(child: Text('Please Enter a Location')),
                    )
                  );
                }
                if (state is WeatherLoadInProgress) {
                  return Expanded(child: Container(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.white,))));
                }
                if (state is WeatherLoadSuccess) {
                  final weather = state.weather;

                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          //height: MediaQuery.of(context).size.height/4,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Image.network(
                                    'http://openweathermap.org/img/w/${weather.mainIcon}.png',
                                    scale: 0.5,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Text(
                                  '${weather.temp.round()}°C \n${weather.main}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(top: 40, bottom: 40),
                              height: MediaQuery.of(context).size.height*2/3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40), bottom: Radius.zero),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        weather.cityName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.location_city,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      Text(
                                        '${weather.coordLon}, ${weather.coordLat}',
                                        style: TextStyle(
                                            fontSize: 10, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      DetailCard('Feels Like:', '${weather.feelsLike.round()}°C'),
                                      DetailCard('Visibility:', weather.visibilty.toString()),
                                      DetailCard('Pressure:', weather.pressure.toString()),
                                      DetailCard('Humidity:', weather.humidity.toString()),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      DetailCard('Min Temp:', '${weather.minTemp.round()}°C'),
                                      DetailCard('Max Temp:', '${weather.maxTemp.round()}°C'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Sunrise and Sunset:',
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Card(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.wb_sunny),
                                              SizedBox(height: 20),
                                              Text('${weather.sunRise} AM IST'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: <Widget>[
                                              Icon(Icons.wb_sunny),
                                              SizedBox(height: 20),
                                              Text('${weather.sunSet} PM IST'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is WeatherLoadFailure) {
                  return Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Enter valid City Name!',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  );
                }
                //return Expanded(child: Container(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.white,))));
                return Text('error');
              },
            )
          ],
        ),
      ),
    );
  }
}
