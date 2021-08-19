import 'package:dsc_shop/Data/DataBase/Api.dart';
import 'package:dsc_shop/Data/Handlers/CartHandler.dart';
import 'package:dsc_shop/Data/Handlers/FavoritesHandler.dart';
import 'package:dsc_shop/Domain/Models/Product.dart';
import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:flutter/foundation.dart';

class StateManager extends ChangeNotifier {
  List<Product> data;
  Product result;
  Map<String, dynamic> favorates, cart;
  AppUser user;
  // bool check = false;
  Future _setFavorites(String email) async => favorates = await FavoriteHandler(email).getProducts();

  setResult(Product product) {
    this.result = product;
    notifyListeners();
  }

  upDateData(List<Product> value) {
    this.data = value;
    result = null;
    notifyListeners();
  }

  Future<void> setData(AppUser use) async {
    List value = await Api().requestData();
    this.cart = null;
    this.user = use;
    this.data = value.map((m) => Product(m["title"], m["description"], m["category"], m["image"], double.parse(m["price"].toString()))).toList();
    await _setFavorites(this.user.email);
    notifyListeners();
  }

  void getCart(String email) async {
    this.cart = await CartHandler(email).getCart();
    this.cart.remove("Email");
    this.data = this.cart.keys.map((e) => Product(e, this.cart[e]['Descreption'], this.cart[e]['Category'], this.cart[e]["Image"], this.cart[e]["Price"])).toList();
    notifyListeners();
  }

  void getFavoirtes(AppUser use) async {
    this.cart = null;
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
