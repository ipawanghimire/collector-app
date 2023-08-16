import 'package:flutter/material.dart';

class CollectionProvider extends ChangeNotifier {
  double _totalDeposit = 0.0;

  double get totalDeposit => _totalDeposit;

  void addToTotalDeposit(double amount) {
    _totalDeposit += amount;
    notifyListeners();
  }

  int _noDeposit = 0;
  int get noDeposit => _noDeposit;
  void addNoDeposit() {
    _noDeposit += 1;
    notifyListeners();
  }

  double _totalLoan = 0.0;

  double get totalLoan => _totalLoan;

  void addToTotalLoan(double amount) {
    _totalLoan += amount;
    notifyListeners();
  }

  int _noloan = 0;
  int get noloan => _noloan;
  void addNoLoan() {
    _noloan = _noloan + 1;
    notifyListeners();
  }

  double _todaysCollection = 0.0;

  double get todaysCollection => _todaysCollection;

  void addToTotalTodaysCollection(double amount) {
    _todaysCollection += amount;
    notifyListeners();
  }

  void resetTotalDeposit() {
    _totalDeposit = 0;
    _noDeposit = 0;
    _noloan = 0;
    _todaysCollection = 0;
    _totalLoan = 0;
    notifyListeners();
  }
}
