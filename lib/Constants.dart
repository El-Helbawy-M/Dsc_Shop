import 'package:dsc_shop/Layout/Screens/HomeScreen.dart';
import 'package:dsc_shop/Layout/Screens/WishlistScreen.dart';
import 'package:dsc_shop/Layout/Tools/StateManager.dart';
import 'package:flutter/material.dart';

import 'Domain/Models/User.dart';

//==================================== Enum Classes
enum TaskState { OK, ERROR }
enum Pages { Home, Favorite, Cart }
//====================================

//==================================== Colors

//====================================

//==================================== TextStyles
TextStyle kTextClothTitleStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.bold);

TextStyle kTextClothPriceStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.green);
TextStyle kTextLogoutStyle = TextStyle(fontSize: 30, color: Colors.black, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600, letterSpacing: 2);
//====================================

//====================================
Map<Pages, Widget> pages(AppUser user) => {
      Pages.Home: Home(user),
      Pages.Favorite: WishListScreen(user),
    };
