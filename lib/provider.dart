import 'package:flutter/material.dart';

class Model extends ChangeNotifier {

  int coffeeCount = 0;
  int sugarCount = 0;
  int? cups = 0; 

  void incrementCoffeeCount() {
    coffeeCount >= 10 ? coffeeCount = 0 : coffeeCount++;
    // print(coffeeCount);
    notifyListeners();
  }

  void incrementSugarCount() {
    sugarCount >= 10 ? sugarCount = 0 : sugarCount++;
    notifyListeners();
  }

  void decrementCoffeeCount() {
    if (coffeeCount > 0) {
      coffeeCount--;
    }
    notifyListeners();
  }

  void decrementSugarCount() {
    if (sugarCount > 0) {
      sugarCount--;
    }
    notifyListeners();
  }
}
