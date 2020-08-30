import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget{

  String title;
  String value;

  DetailCard(this.title, this.value);

  @override
  Widget build(BuildContext context) {
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