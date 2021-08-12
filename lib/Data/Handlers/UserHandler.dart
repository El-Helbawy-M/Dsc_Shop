import 'package:dsc_shop/Data/DataBase/Firebase.dart';
import 'package:dsc_shop/Domain/Models/User.dart';

import '../../Constants.dart';

class UserHandler extends Database {
  AppUser user;
  UserHandler(this.user) : super("Users");
  Future<TaskState> addUser() => addDocument({"Name": this.user.name, "Email": this.user.email, "Image": this.user.image});
  Future<TaskState> upDateUser(Map<String, Object> data) => upDateDocument(this.user.email, data);
  Future<Map> getCart() => getData(this.user.email);
}
