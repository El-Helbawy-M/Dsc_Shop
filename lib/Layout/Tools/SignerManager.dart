import 'package:flutter/cupertino.dart';

class Signer extends ChangeNotifier {
  String name = "", email = "", password = "";
  bool loading = false;

  setName(String value) {
    this.name = value;
    notifyListeners();
  }

  setEmail(String value) {
    this.email = value;
    notifyListeners();
  }

  setPassword(String value) {
    this.password = value;
    notifyListeners();
  }

  setLoading() {
    this.loading = !this.loading;
    notifyListeners();
  }
}
