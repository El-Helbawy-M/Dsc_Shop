import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:flutter/foundation.dart';

class SearchManager extends ChangeNotifier {
  String text = "";
  bool stillSearching = false;
  List<Product> data;

  setData(List<Product> value) {
    this.data = value;
    notifyListeners();
  }

  changeText(String value) {
    this.text = value;
    notifyListeners();
  }

  check(bool value) {
    this.stillSearching = value;
    notifyListeners();
  }
}
