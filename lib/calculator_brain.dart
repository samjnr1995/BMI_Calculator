import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});
  final int? height;
  final int? weight;
  double? _bmi;

  String? calculateBmi () {
     _bmi = weight! / pow(height! / 100,  2);
    return _bmi?.toStringAsFixed(1);
  }
  String getResult() {
    if (_bmi! >= 25){
      return 'Overweight';
    }else if(_bmi! > 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getInterpretation() {
    if (_bmi! >= 25){
      return 'your body weight is higher than normal, exercise more';
    }else if(_bmi! > 18.5){
      return 'Great, you have a normal body weight';
    }else{
      return 'your body weight is low, you can eat more';
    }

  }
}