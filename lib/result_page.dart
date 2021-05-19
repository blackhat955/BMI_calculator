import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiresult,
      @required this.interpretationValue,
      @required this.resultText});
  final String bmiresult;
  final String resultText;
  final String interpretationValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'BMI SEVERITY',
                style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF45C5D4)),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              colour: activeColor,
              cardData: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiresult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    interpretationValue,
                    textAlign: TextAlign.center,
                    style: bmiValueStyle,
                  )
                ],
              ),
            ),
          ),
          BottumButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTittle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
