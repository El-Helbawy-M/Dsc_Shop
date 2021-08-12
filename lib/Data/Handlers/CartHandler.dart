import 'package:dsc_shop/Data/DataBase/Firebase.dart';

import '../../Constants.dart';

class CartHandler extends Database {
  String email;
  CartHandler(this.email) : super("Shopping Cart");
  Future<State> addUser() => addDocument({"Email": this.email});
  Future<State> upDateCart(Map<String, Object> data) => upDateDocument(this.email, data);
  Future<Map> getCart() => getData(this.email);
}
