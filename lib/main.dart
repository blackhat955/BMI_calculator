import 'package:flutter/material.dart';
import 'input_type.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //read colorClass and cookbooks digine  in flutter
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.orangeAccent,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),
      home: InputPage(),
    );
  }
}
