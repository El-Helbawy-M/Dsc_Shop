import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_shop/Data/Handlers/CartHandler.dart';
import 'package:dsc_shop/Data/Handlers/FavoritesHandler.dart';
import 'package:dsc_shop/Data/Handlers/UserHandler.dart';
import 'package:dsc_shop/Domain/Models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Constants.dart';

class Auther {
  FirebaseAuth auther = FirebaseAuth.instance;

  Future<State> register(AppUser user, String password) async {
    UserCredential result;
    try {
      while (result == null) result = await auther.createUserWithEmailAndPassword(email: user.email, password: password);
      await UserHandler(user).addUser();
      await FavoriteHandler(user.email).addUser();
      await CartHandler(user.email).addUser();
    } catch (e) {
      print(e);
      return State.ERROR;
    }
    return State.OK;
  }

  Future<State> signIn(String email, String password) async {
    UserCredential result;
    try {
      while (result == null) result = await auther.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      return State.ERROR;
    }
    return State.OK;
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
  Future<State> addDocument(Map<String, Object> data) async {
    try {
      await db.collection(this.table).doc(data['Email']).set(data);
    } catch (e) {
      print(e);
      return State.ERROR;
    }
    return State.OK;
  }

  Future<Map> getData(String email) async {
    Map data;
    await db.collection(this.table).doc(email).get().then((value) => data = value.data());
    return data;
  }

  Future<State> upDateDocument(String email, Map<String, Object> data) async {
    try {
      await db.collection(this.table).doc(email).update(data);
    } catch (e) {
      print(e);
      return State.ERROR;
    }
    return State.OK;
  }

  Future<State> clearDataDocument(String email) async {
    try {
      await db.collection(this.table).doc(email).set({});
    } catch (e) {
      print(e);
      return State.ERROR;
    }
    return State.OK;
  }
  //=================================================
  //=================================================
}
