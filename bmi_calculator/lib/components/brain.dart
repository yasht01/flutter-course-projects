import 'dart:math';

enum Gender { Male, Female }

class Brain {
  double weight;
  int age;
  double height;
  double feet;
  String heightUnit;
  String weightUnit;
  Gender userGender;
  double _bmi;

  Brain({
    this.age,
    this.height,
    this.heightUnit,
    this.weight,
    this.weightUnit,
  });

  double convertToCm(double height) {
    double result = (height * 12) * (2.54);
    return result;
  }

  double convertToKg(double weight) {
    double result = weight * 0.45;
    return result;
  }

  double convertToLb(double weight) {
    double result = weight * 2.20;
    return result;
  }

  double convertToFtIn(double height) {
    double inches = height * 0.39;
    feet = inches / 12;
    return feet;
  }

  String calculateBMI() {
    if (heightUnit == 'ft-in') {
      height = convertToCm(height);
    }
    if (weightUnit == 'lb') {
      weight = convertToKg(weight);
    }

    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }
}
