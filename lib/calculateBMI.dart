import 'dart:math';

class CalculateBMI {
  CalculateBMI(this.weight, this.height);

  final int height;
  final int weight;

  double _bmi;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    print("The bmi is " + _bmi.toString());
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String Intrepretation() {
    if (_bmi >= 25) {
      return "Excersise more";
    } else if (_bmi > 18) {
      return "Goor Job";
    } else {
      return "Eat more";
    }
  }
}
