import 'package:flutter/foundation.dart';

class AppProvider with ChangeNotifier {
  bool lightTheme = true;

  void toggleTheme() {
    lightTheme = !lightTheme;
    notifyListeners();
  }

  int _currentIndex = 0;

  get getCurrentIndex => _currentIndex;

  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
