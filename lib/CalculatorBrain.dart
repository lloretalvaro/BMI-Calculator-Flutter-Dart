import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultClassification() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getResultInterpretation() {
    if (_bmi >= 25) {
      return 'A healthy alimentation and daily exercise are benefitial but you should visit a doctor';
    } else if (_bmi > 18.5) {
      return 'Nice done, keep having a healthy lifestyle!';
    } else {
      return 'High-calorie foods could help you but you should visit a doctor';
    }
  }
}
