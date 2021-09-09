import 'package:flutter/foundation.dart';

class CounterService extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter = counter + 1;
    notifyListeners();
  }
}
