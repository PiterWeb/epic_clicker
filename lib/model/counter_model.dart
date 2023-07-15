import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counterValue = 2000;
  double multiplier = 1;
  int get counterValue => _counterValue;

  void reset() {
    _counterValue = 0;
    notifyListeners();
  }

  void increment() {
    add(1);
  }

  void add(int value) {
    _counterValue += (value * multiplier).round();
    notifyListeners();
  }

  bool subtract(int value) {
    if (_counterValue - value < 0) {
      return false;
    }
    _counterValue -= value;
    notifyListeners();
    return true;
  }

  void multiply(int value) {
    _counterValue *= value;
    notifyListeners();
  }

  void setMultiplier(double value) {
    multiplier = value;
    notifyListeners();
  }

  void concatMultiplier(double newMultiplier) {
    multiplier *= newMultiplier;
    notifyListeners();
  }

  void resetMultiplier(double oldMultiplier) {
    multiplier /= oldMultiplier;
    notifyListeners();
  }

  void resetAllMultipliers() {
    multiplier = 1;
    notifyListeners();
  }
}
