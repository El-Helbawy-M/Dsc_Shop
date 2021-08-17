import 'package:flutter/foundation.dart';

class SearchManager extends ChangeNotifier {
  String text = "";
  bool stillSearching = false;

  changeText(String value) {
    this.text = value;
    notifyListeners();
  }

  check(bool value) {
    this.stillSearching = value;
    notifyListeners();
  }
}
