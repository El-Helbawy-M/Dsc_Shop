import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_shop/Data/Handlers/CartHandler.dart';
import 'package:dsc_shop/Data/Handlers/FavoritesHandler.dart';
import 'package:dsc_shop/Data/Handlers/UserHandler.dart';
import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Constants.dart';

class Auther {
  FirebaseAuth auther = FirebaseAuth.instance;

  Future<TaskState> register(AppUser user, String password) async {
    try {
      await auther.createUserWithEmailAndPassword(email: user.email, password: password);
      await UserHandler(user).addUser();
      await FavoriteHandler(user.email).addUser();
      await CartHandler(user.email).addUser();
    } catch (e) {
      print(e);
      return TaskState.ERROR;
    }
    return TaskState.OK;
  }

  Future<TaskState> signIn(String email, String password) async {
    try {
      await auther.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      return TaskState.ERROR;
    }
    return TaskState.OK;
  }
}

class Database {
  //================================================= Variables
  //=================================================
  FirebaseFirestore db = FirebaseFirestore.instance;
  String table;
  //=================================================
  //=================================================

  //================================================= Functions
  //=================================================

  Database(this.table);
  Future<TaskState> addDocument(Map<String, Object> data) async {
    try {
      await db.collection(this.table).doc(data['Email']).set(data);
    } catch (e) {
      print(e);
      return TaskState.ERROR;
    }
    return TaskState.OK;
  }

  Future<Map> getData(String email) async {
    Map data;
    await db.collection(this.table).doc(email).get().then((value) => data = value.data());
    return data;
  }

  Future<TaskState> upDateDocument(String email, Map<String, Object> data, [bool set = false]) async {
    try {
      (set) ? await db.collection(this.table).doc(data['Email']).set(data) : await db.collection(this.table).doc(email).update(data);
    } catch (e) {
      print(e);
      return TaskState.ERROR;
    }
    return TaskState.OK;
  }

  Future<TaskState> clearDataDocument(String email) async {
    try {
      await db.collection(this.table).doc(email).set({});
    } catch (e) {
      print(e);
      return TaskState.ERROR;
    }
    return TaskState.OK;
  }
  //=================================================
  //=================================================
}
