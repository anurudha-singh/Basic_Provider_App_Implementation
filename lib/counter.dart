import 'package:flutter/material.dart';

class CounterOne extends ChangeNotifier {
  var _count = 0;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }
}