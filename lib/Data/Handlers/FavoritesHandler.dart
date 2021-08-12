import 'package:dsc_shop/Data/DataBase/Firebase.dart';

import '../../Constants.dart';

class FavoriteHandler extends Database {
  String email;
  FavoriteHandler(this.email) : super("Favorites");
  Future<State> addUser() => addDocument({"Email": this.email});
  Future<State> upDateFavorites(Map<String, Object> data) => upDateDocument(this.email, data);
  Future<Map> getProducts() => getData(this.email);
}
