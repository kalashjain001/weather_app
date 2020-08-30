import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String main = 'Clear';
  String cityName = 'Bengaluru';
  String coord = '12.98, 77.6';
  String temp = '25 C';
  String visibilty = '5000';
  String pressure = '1013 hPa';
  String humidity = '94%';
  String minTemp = '23 C';
  String maxTemp = '23 C';
  String sunRise = '5:53 AM IST';
  String sunSet = '18:47 PM IST';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[400],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40), bottom: Radius.zero),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 40,),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        cityName,
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
                        coord,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      detailCard('Feels Like:', temp),
                      detailCard('Visibility:', visibilty),
                      detailCard('Pressure:', pressure),
                      detailCard('Humidity:', humidity),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      detailCard('Min Temp:', minTemp),
                      detailCard('Max Temp:', maxTemp),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Sunrise and Sunset:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                              Text(sunRise),
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
                              Text(sunSet),
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
        ],
      ),
    );
  }

  Card detailCard(String title, String value){
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(value, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
