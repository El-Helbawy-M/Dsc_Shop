import 'package:dsc_shop/Data/DataBase/Api.dart';
import 'package:dsc_shop/Data/Handlers/FavoritesHandler.dart';
import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:flutter/foundation.dart';

class StateManager extends ChangeNotifier {
  List<Product> data;
  Map<String, Object> favorates;
  AppUser user;
  // bool check = false;
  Future _setFavorites(String email) async => favorates = await FavoriteHandler(email).getProducts();

  Future<void> setData(AppUser use) async {
    List value = await Api().requestData();
    this.user = use;
    this.data = value.map((m) => Product(m["title"], m["description"], m["category"], m["image"], double.parse(m["price"].toString()))).toList();
    await _setFavorites(this.user.email);
    notifyListeners();
  }

  void getFavoirtes(AppUser use) async {
    await setData(use);
    this.data = this.data.where((e) => this.favorates.containsKey(e.name)).toList();
    notifyListeners();
  }

  Map addFavorite(Product product) {
    this.favorates.addAll({
      product.name: {"Image": product.image, "Price": product.price}
    });
    notifyListeners();
    return this.favorates;
  }

  Map subFavorite(String key) {
    this.favorates.remove(key);
    notifyListeners();
    return this.favorates;
  }

  void clear() {
    this.data = null;
    this.favorates = null;
    notifyListeners();
  }

  // void reCheck() {
  //   this.check = true;
  //   notifyListeners();
  // }
}
