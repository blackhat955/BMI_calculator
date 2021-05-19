import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_iconbutton.dart';

enum Gender {
  //used to create the such kind of value which is use to check the condition
  // stratified
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 45;
  int age = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI CALCULATOR',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? activeColor
                          : inactiveColor,
                      cardData: IconContant(
                        icon: FontAwesomeIcons.mars,
                        lable: "MALE",
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeColor
                          : inactiveColor,
                      cardData: IconContant(
                        icon: FontAwesomeIcons.venus,
                        lable: "FEMALE",
                      ),
                    ),
                  )
                ],
              ),
            ),

            //height----------------------------->>>>>>

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableWidget(
                      colour: activeColor,
                      cardData: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: lableTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: cardInsideValue,
                              ),
                              Text(
                                'cm',
                                style: lableTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              activeTickMarkColor: Colors.green,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 100,
                              max: 200,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //other two cards
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableWidget(
                      colour: colourValue,
                      cardData: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: lableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: cardInsideValue,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (weight > 5) {
                                      weight--;
                                    } else {
                                      weight = 5;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableWidget(
                      colour: colourValue,
                      cardData: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: lableTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: cardInsideValue,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    } else {
                                      age = 1;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottumButton(
              buttonTittle: 'CALCULATE YOUR BMI',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                print(double.parse(calc.calculateBMI()));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiresult: calc.calculateBMI(),
                      resultText:
                          calc.getResult(double.parse(calc.calculateBMI())),
                      interpretationValue: calc
                          .getInterpretation(double.parse(calc.calculateBMI())),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
