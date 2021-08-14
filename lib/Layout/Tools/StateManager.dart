import 'package:dsc_shop/Data/DataBase/Api.dart';
import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:flutter/foundation.dart';

class StateManager extends ChangeNotifier {
  List<Product> data;
  // bool check = false;
  
  setData() async {
    List value = await Api().requestData();
    this.data = value.map((m) => Product(m["title"], m["description"], m["category"], m["image"], double.parse(m["price"].toString()))).toList();
    print(this.data);
    notifyListeners();
  }

  // void reCheck() {
  //   this.check = true;
  //   notifyListeners();
  // }
}
