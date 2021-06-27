import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier {
  String _message = 'You haven\'t given any input';
  bool _isEligible = false;

  String get message => _message;
  bool get isEligible => _isEligible;

  void checkEligibility(int age) {
    if (age >= 18) {
      eligible();
    } else {
      notEligible();
    }
  }

  void eligible() {
    _message = 'You are eligible to apply for liscense';
    _isEligible = true;
    notifyListeners();
  }

  void notEligible() {
    _message = 'You are not eligible to apply for liscense';
    _isEligible = false;
    notifyListeners();
  }
}
