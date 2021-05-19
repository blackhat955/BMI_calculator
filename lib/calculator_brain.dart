import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double bmi = 0;
  String calculateBMI() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(double bmi) {
    if (bmi > 30) {
      return 'OBESITY';
    } else if (bmi > 25) {
      return 'OVERWEIGHT';
    } else if (bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(double bmi) {
    if (bmi > 30) {
      return 'Your weight fall under severity level pls do exercise ';
    } else if ((bmi > 25) && (bmi < 29.9)) {
      return 'You are overweight eat healthy and do exercise';
    } else if ((bmi > 18.5) && (bmi < 24.9)) {
      return 'BMI is normal eat healthy and do exercise  ';
    } else {
      return 'You are underweight keep good amount of calories to increase your weight ';
    }
  }
}
